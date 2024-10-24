use serde::{Deserialize, Serialize};
use serde_json::Result;
use std::fs::File;
use std::io::{self, Read, Write};
use std::fmt;

#[derive(Debug)]
enum Language {
    C,
    Csharp,
    Cpp
}

impl Language {
    fn extension(&self) -> &str {
        match self {
            Language::C => "c",
            Language::Cpp => "cpp",
            Language::Csharp => "cs",
        }
    }
}

impl std::str::FromStr for Language {
    type Err = String;

    fn from_str(input: &str) -> std::result::Result<Language, Self::Err> {
        match input.to_lowercase().as_str() {
            "c" => Ok(Language::C),
            "cpp" => Ok(Language::Cpp),
            "csharp" => Ok(Language::Csharp),
            _ => Err(format!("Unsupported language: {}", input)),
        }
    }
}

#[derive(Serialize, Deserialize, Debug)]
struct InputData {
    code: String,
    test_cases: Vec<String>,
    language: String,
}

fn main() -> Result<()> {
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).expect("Failed to read from stdin");

    let input_data: InputData = serde_json::from_str(&input)?;

    let language: Language = input_data.language.parse().expect("Unsupported language");

    let code_filename = format!("output_code.{}", language.extension());

    let mut code_file = File::create(&code_filename).expect("Failed to create code file");
    code_file.write_all(input_data.code.as_bytes()).expect("Failed to write code to file");
    println!("Code saved to {}", code_filename);

    let mut test_cases_file = File::create("test_cases.txt").expect("Failed to create test_cases.txt");
    for test_case in input_data.test_cases {
        writeln!(test_cases_file, "{}", test_case).expect("Failed to write test case to file");
    }
    println!("Test cases saved to test_cases.txt");

    Ok(())
}

