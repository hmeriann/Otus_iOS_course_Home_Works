Pod::Spec.new do |spec|
  spec.name         = "zuhwpod"
  spec.version      = "0.0.1"
  spec.summary      = "OTUS Homework module for demonstrations"

  spec.description  = <<-DESC
	This is the demo lesson project for OTUS Homework
                   DESC

  spec.homepage     = "https://github.com/hmeriann/Otus_iOS_course_Home_Works/tree/main/ZuHW"
  spec.license      = { :type => "MIT" }
  spec.author             = { "Zuleykha Pavlichenkova" => "ya-zu@yandex.ru" }

  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/hmeriann/Otus_iOS_course_Home_Works/tree/main/ZuHW", :tag => "#{spec.version}" }

  spec.dependency 'SnapKit'
  spec.source_files  = "ZuHW/**/*.{swift,h,m}"

  spec.public_header_files = "ZuHW/**/*.{h}"

  spec.swift_version = "5.0" 
end