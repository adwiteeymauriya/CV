#import "@preview/basic-resume:0.2.9": *

// Load CV data from YAML (default: cv.yaml, override with --input cv=filename.yaml)
#let cv-file = sys.inputs.at("cv", default: "cv.yaml")
#let cv = yaml(cv-file)

#show: resume.with(
  author: cv.name,
  location: cv.location,
  email: cv.email,
  github: cv.github,
  linkedin: cv.linkedin,
  phone: cv.phone.join(" | "),
  personal-site: cv.personal_site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

// Summary
#cv.summary

== Work Experience

#for job in cv.work_experience [
  #work(
    title: job.title,
    company: job.company,
    location: job.location,
    dates: dates-helper(start-date: job.start_date, end-date: job.end_date),
  )
  #for detail in job.details [
    - #detail
  ]
  #if job.tech_stack.len() > 0 [
    - *Tech Stack*: #job.tech_stack.join(", ")
  ]
]

== Education

#for edu_item in cv.education [
  #edu(
    institution: edu_item.institution,
    location: edu_item.location,
    degree: edu_item.degree,
    dates: dates-helper(start-date: edu_item.start_date, end-date: edu_item.end_date),
  )
  #for detail in edu_item.details [
    - #detail
  ]
]

== Skills & Languages

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Programming Languages*\
    Advanced: #cv.programming_languages.advanced.join(", ")\
    Intermediate: #cv.programming_languages.intermediate.join(", ")
  ],
  [
    *Languages*\
    #cv.languages.join(", ")

    *Soft Skills*\
    #cv.soft_skills.join(", ")
  ],
)
