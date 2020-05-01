{\rtf1\ansi\ansicpg936\cocoartf2512
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #\
#  Be sure to run `pod spec lint ZHXTabView.podspec' to ensure this is a\
#  valid spec and to remove all comments including this before submitting the spec.\
#\
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html\
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/\
#\
\
Pod::Spec.new do |spec|\
\
  # \uc0\u8213 \u8213 \u8213   Spec Metadata  \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  These will help people to find your library, and whilst it\
  #  can feel like a chore to fill in it's definitely to your advantage. The\
  #  summary should be tweet-length, and the description more in depth.\
  #\
\
  spec.name         = "ZHXTabView"\
  spec.version      = "0.0.2"\
  spec.summary      = "A support custom Tab component, support animation, corner, mask."\
\
  # This description is used to generate tags and improve search results.\
  #   * Think: What does it do? Why did you write it? What is the focus?\
  #   * Try to keep it short, snappy and to the point.\
  #   * Write the description between the DESC delimiters below.\
  #   * Finally, don't worry about the indent, CocoaPods strips it!\
  spec.description  = <<-DESC\
  A support custom Tab component, support animation, corner, mask\
                   DESC\
\
  spec.homepage     = "https://github.com/zhangxistudy11/ZHXTabView"\
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"\
\
\
  # \uc0\u8213 \u8213 \u8213   Spec License  \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  Licensing your code is important. See https://choosealicense.com for more info.\
  #  CocoaPods will detect a license file if there is a named LICENSE*\
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.\
  #\
\
  spec.license      = "MIT"\
  # spec.license      = \{ :type => "MIT", :file => "FILE_LICENSE" \}\
\
\
  # \uc0\u8213 \u8213 \u8213  Author Metadata  \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  Specify the authors of the library, with email addresses. Email addresses\
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also\
  #  accepts just a name if you'd rather not provide an email address.\
  #\
  #  Specify a social_media_url where others can refer to, for example a twitter\
  #  profile URL.\
  #\
\
  spec.author             = \{ "zhangxi" => "zhangxilove2011@163.com" \}\
  # Or just: spec.author    = "zhangxi"\
  # spec.authors            = \{ "zhangxi" => "xiza@ctrip.com" \}\
  spec.social_media_url   = "https://www.jianshu.com/u/c4d558e26604"\
\
  # \uc0\u8213 \u8213 \u8213  Platform Specifics \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  If this Pod runs only on iOS or OS X, then specify the platform and\
  #  the deployment target. You can optionally include the target after the platform.\
  #\
\
  spec.platform     = :ios\
  # spec.platform     = :ios, "5.0"\
\
  #  When using multiple platforms\
  spec.ios.deployment_target = "8.0"\
  # spec.osx.deployment_target = "10.7"\
  # spec.watchos.deployment_target = "2.0"\
  # spec.tvos.deployment_target = "9.0"\
\
\
  # \uc0\u8213 \u8213 \u8213  Source Location \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  Specify the location from where the source should be retrieved.\
  #  Supports git, hg, bzr, svn and HTTP.\
  #\
\
  spec.source       = \{ :git => "https://github.com/zhangxistudy11/ZHXTabView", :tag => "#\{spec.version\}" \}\
\
\
  # \uc0\u8213 \u8213 \u8213  Source Code \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  CocoaPods is smart about how it includes source code. For source files\
  #  giving a folder will include any swift, h, m, mm, c & cpp files.\
  #  For header files it will include any header in the folder.\
  #  Not including the public_header_files will make all headers public.\
  #\
\
  spec.source_files  = 'ZHXTabView/ZHXTabView/*'\
  #spec.exclude_files = "Classes/Exclude"\
\
  # spec.public_header_files = "Classes/**/*.h"\
\
\
  # \uc0\u8213 \u8213 \u8213  Resources \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  A list of resources included with the Pod. These are copied into the\
  #  target bundle with a build phase script. Anything else will be cleaned.\
  #  You can preserve files from being cleaned, please don't preserve\
  #  non-essential files like tests, examples and documentation.\
  #\
\
  # spec.resource  = "icon.png"\
  # spec.resources = "Resources/*.png"\
\
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"\
\
\
  # \uc0\u8213 \u8213 \u8213  Project Linking \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  Link your library with frameworks, or libraries. Libraries do not include\
  #  the lib prefix of their name.\
  #\
\
  # spec.framework  = "SomeFramework"\
  # spec.frameworks = "SomeFramework", "AnotherFramework"\
\
  # spec.library   = "iconv"\
  # spec.libraries = "iconv", "xml2"\
\
\
  # \uc0\u8213 \u8213 \u8213  Project Settings \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213 \u8213  #\
  #\
  #  If your library depends on compiler flags you can set them in the xcconfig hash\
  #  where they will only apply to your library. If you depend on other Podspecs\
  #  you can include multiple dependencies to ensure it works.\
\
  spec.requires_arc = true\
\
  # spec.xcconfig = \{ "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" \}\
  # spec.dependency "JSONKit", "~> 1.4"\
\
end\
}