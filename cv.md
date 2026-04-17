---
author-meta: Michal Kielbowicz, Software Engineer
colorlinks: true
fontsize: 11pt
geometry:
- margin=15mm
github: jupblb
lang: en-US
linkedin: mkielbowicz
pagestyle: empty
title-meta: Michal Kielbowicz CV
urlcolor: blue
---

# Michal Kielbowicz

## Summary

Software engineer with 10+ years of versatile experience, currently a tech lead
at Sourcegraph. I've worked across the stack (Kubernetes, Waymo One) in
organizations of varying sizes (Big Tech, small startups). I have a psychology
degree, a daughter, and I care about the human side of engineering as much as
the technical one. I like communicating using walls of text, so here's one for
you.

## Experience

### Software Engineer, Sourcegraph, Remote [08.2025-Present]{.date}

I was drawn to Sourcegraph because I had been a heavy user of Code Search back
at Alphabet. I knew some of the people who worked here, appreciated the culture
of openness and its remote-first approach. But this company was severely
affected by [AI hype] and this resulted in major organizational changes.

This way I very quickly and unexpectedly became the tech lead for the Code
Intelligence product area. My responsibilities stretch from improving Code
Navigation UX to leading efforts around [SCIP] - a language-agnostic protocol
for indexing source code. If you happen to be a user of our product, I'd love to
hear your feedback about what you'd like to see improved.

Examples of the projects I've led so far:

1.  Established [an independent organization] around the SCIP protocol and
    related code indexer implementations, in partnership with Meta and Uber. We
    work together on improving the software ecosystem, making it work at the
    scale of Big Tech companies.
2.  Introduced UX features that blend our code search agent with the traditional
    code navigation experience.
3.  Continued support of our largest customers: Stripe, Uber, Apple, etc. Many
    interesting things happened as part of this, but going into the details
    would be too technical.
4.  Experimented with making our AI agents:
    -   read or modify files using tree-sitter queries, treating source files
        more like ASTs
    -   navigate through a customer's codebase using LSP-like methods.

### Software Engineer, Waymo, Remote [10.2023-07.2025]{.date}

Delivered full-stack features for Waymo One. Initially worked on adding support
for new payment methods (most notably Google Pay) and payment processors. Later
involved in designing and building a system for fraud detection and device-level
banning.

I was one of the founding employees (#2) of Waymo in Poland. The company,
originally known as the Google Self-Driving Car Project, opened its first major
engineering hub outside of Silicon Valley in Warsaw in 2023.

It was the most exciting and interesting job I have ever had. Initially, I
worked on billing - my onboarding project was adding Google Pay support to the
Waymo One app. Coming from pure infrastructure work (Kubernetes), suddenly
becoming a full-stack mobile app developer was very refreshing.

Gradually, my responsibilities shifted toward becoming the area expert on fraud
and violations, leading multiple projects in this space. Examples of problems I
was solving include:

-   Handling vandalism spikes from expanding into university campuses
-   Banning armed robbers who used our cabs as getaway vehicles
-   Identifying and closing loopholes exploited by fraudulent users

Making progress in this area required coordinating with various tech leads, data
scientists, lawyers (a lot of lawyers), and UX engineers. It was very delicate
work. During my time at the company, we managed to cut losses by more than 50%.

Unfortunately, this came at the cost of having most critical work -
communication - in the evenings, local time. With a small child who hates
sleeping, a switch to remote after moving back to my home city, and a wife who
also has a career, I decided to move to something more fitting my needs.

### Software Engineer, Google, Warsaw [08.2020-10.2023]{.date}

My wife and I both applied to Google in 2020 --- she got in first, and the week
before my own acceptance was tense. COVID redirected us from Zurich to Warsaw,
where I would spend the next five years at Alphabet.

1.  **Google.org (MicroMentor)** [04.2023-10.2023]{.date}

    In Q1 2023 my daughter was born, my GKE team was disbanded (reorg), and I
    found myself looking for a new project. It was also the time of Google's
    first mass layoffs, so options were scarce. I ultimately decided to take
    advantage of my situation to spend half a year working on [a non-profit
    project]. A very refreshing experience - I'm grateful I had the opportunity.

    We worked on a Flutter app for young entrepreneurs to find mentors who would
    help them start their own businesses. The entire project was open source and
    offered interesting insight into how MicroMentor operates.

2.  **Google Kubernetes Engine** [04.2021-04.2023]{.date}

    Spent two years ensuring our largest customers could run GKE at a scale of
    15,000 compute nodes. I have never worked on a more complex product in my
    life. Understanding the Kubernetes stack, including the Google Cloud setup,
    and finding root causes of various problems was hard work. It didn't have
    much to do with regular programming, outside of improving our internal and
    [external test infrastructure], but I'd say it was a very senior engineering
    job.

    The project I'm most proud of during my time with this team was building a
    DSL for structuring integration tests. We needed to ensure GKE worked under
    various Cloud setups and workloads. With my changes, we could define
    building blocks for specific parts of configuration (e.g., enabling
    `nodelocaldns` required setting up two different infrastructure components)
    in a way that made them configurable, extensible, and overridable with
    reasonable constraints.

    I had to track my progress on so many different fronts that I eventually
    started an open-source project I'm very proud of - [google/gtasks-md]. It
    allows editing Google Tasks through a Markdown document. The tool uses a
    Kubernetes-style reconciliation loop to satisfy user modifications. Quite
    useful in the age of AI agents.

3.  **Cloud Data Catalog** [08.2020-03.2021]{.date}

    Some people at the time would boast about implementing a blockchain of
    blockchains, but *I* was working on a database of databases. Or, per our
    marketing materials, "a fully managed and highly scalable data discovery and
    metadata management service."

    Initially, the product had individual connectors to various data sources
    that would periodically poll for updates. It was hard to maintain. So we
    decided to use [Cloud logging] infrastructure to build a unified solution
    that consumed events about metadata changes and updated the state of our
    backend.

    Coming from a small startup of \~10 software engineers, this was quite a
    culture shock - especially since it was the year Google started hiring like
    crazy and switched to remote mode. But I survived.

### Software Engineer, TravelTime, Remote [02.2018-06.2020]{.date}

After growing disenchanted with Polish corporate life, I found probably the
coolest remote job I've ever had. We built a Google Maps API competitor that was
dirt cheap and surprisingly functional. Our main feature was the ability to
quickly filter up to 200,000 points on the map based on whether they were
reachable from a given destination, within a specific amount of time, using
various public transportation modes or a car.

To make this work with low latency, we had to preprocess the map data. One of my
main achievements was improving the processing time by optimizing the
implementation and making use of AWS Spot Instances. This allowed us to update
the geo datasets more frequently and start offering support for a wider area.

We would meet every quarter in Kaunas, Lithuania, for a very pleasant offsite.
Great CEO, great people. Shameless plug: if you need such an API in your
product, I can recommend this company.

### Software Engineer, Nokia Networks, Wroclaw [09.2017-02.2018]{.date}

My team was building a library to be used in Apache Zeppelin for data analysis
of telecommunication data. It was decent enough, but very soon after joining I
had a feeling that the wider project didn't have enough momentum to go anywhere.
The last straw was when senior leadership from Finland came to inspect the
project and, as part of our presentation, our TL showed a [GitHub repo with
fabricated activity] with commits belonging to the same author using multiple
email addresses, to demonstrate "widespread interest in our work."

The project was scrapped shortly after I left. The only thing remaining is a
[promotional video].

### Thesis Student, SAP, Walldorf [02.2017-07.2017]{.date}

Wrote my Master's thesis on optimizing compute usage in [Spark Streaming], based
on ideas from the [FUGU] research project. After reading a few dozen papers on
the topic and Spark's codebase, it became pretty obvious that (a) predicting the
future is objectively difficult, and (b) resource usage doesn't scale linearly
with the size of the input.

We were unable to find a solution to the first problem, so we relied on
established heuristics from the time series analysis domain. We did something
cool about the latter, though. Each map-reduce data processing pipeline consists
of a number of serialized steps, forming a DAG. I was able to write a system
that could simulate this compute graph for arbitrary input constraints. With
that, I could use a "binary search by score" trick to quickly verify whether the
cluster could be scaled up or down.

There is obviously more to this, but in terms of experience - it was frustrating
to dive deep into many directions with new ideas on how to reach a novel
solution and go nowhere. The final solution did show *some* advantage over the
default resource allocator, but I think I was just lucky.

My thesis supervisor from SAP taught me to eat white asparagus, which I consider
to be a very German thing.

### Intern, Amazon, Edinburgh [07.2016-09.2016]{.date}

Contributed to non-controversial parts of probably the most controversial
project in my career: [Amazon Sourcerer]. It leveraged NLP techniques to
automatically grade potential employees. It gave me 4.5 out of 5 stars for a
junior SWE position. I was very surprised to learn, half a year after the
internship ended, that the entire project was scrapped because the AI model
turned out to be sexist after being trained on historical data. It's quite scary
to see this becoming a thing again in the era of LLMs.

### Software Engineer, BrightIT, Wroclaw [01.2016-06.2016]{.date}

That company built one hell of a wrapper around [HP Teamsite CRM] that actually
made it usable. By today's standards the core tech stack is ancient, but we did
an amazing job setting up Scala bindings for the API, packaging it with Docker,
automating setups with Puppet, and balancing load with Varnish. I don't remember
ever again being in a place where so many new technologies were used around a
single project.

I was integrating another HP project into the ecosystem, Idol, which was
something like Elasticsearch. I personally chose the name for the project -
Bright + Idol = Brighdol. We had a lot of fun, and this was eventually deployed
to production, enabling a better text search experience through CRM resources.

I also introduced CI via Travis and found my first exposure to startup culture
invaluable.

### Intern, ABB, Zurich [06.2015-11.2015]{.date}

My first international adventure! I was about to take advantage of the Erasmus
programme and go to Paderborn when this opportunity appeared. I will be forever
grateful to a member of the university staff who made it possible, as I honestly
believe this is the moment my career was properly kickstarted.

I worked with a principal scientist on a continuation of the [myTOSA] project.
It involved building a network of electric bus stops where some of them have a
wireless charger. The trick was that these would charge the battery by a few
percent each time the vehicle stopped. Since the cost of a battery grows
non-linearly with capacity, this enabled major savings.

The specific project I was given was writing a web app from scratch for a solver
that, given information about the map and desired bus line routes, would output
optimal placement of the chargers. Since I was again in a position of total
control over technical details, given my previous experience I should have
chosen boring technologies and stuck to the minimum. But I was also young, so I
chose a variety of previously unknown technologies: Scala, Play Framework,
ReactJS (0.15!).

Fortunately, the quality of the final solution at the end of my contract was
good enough for the project to continue for some time, until it turned out that
batteries had gotten cheap enough to prefer infrastructure simplicity over the
level of savings this project could provide. I miss living in Switzerland to
this day, ten years later.

### Software Engineer, Nokia Networks, Wroclaw [07.2014-05.2015]{.date}

It took three attempts for me to get this part-time job. Nokia Networks in
Wroclaw is a bit like Google in Silicon Valley - it's the default destination
for a great number of local graduates.

I remember hearing stories at the time about Microsoft interns having Maroon 5
concerts and free Xboxes on their start date. I got an old HP laptop with one of
the very last Intel CPUs before the introduction of Core 2 Duo. As students, we
were just colocated in an open-space area and would wait for a project to pop
up. It was usually something around developer tooling. Most of my friends from
that time were maintaining a local Redmine instance. Together, we would learn to
play table foosball pretty well.

I, however, was working on a pretty cool brand-new project. The company's main
product is the Base Transmitter Station (BTS). After deployment, each antenna
may use a completely different, unversioned configuration. The tool I was
working on aggregated information about these configurations, took versioned
snapshots of them, and allowed running a diff of any two configs at the same
version.

It sounds cool; the team I worked for enjoyed the demo I provided them with
after a few months, but - oh wow - I still remember how disappointing the first
code review was. Due to a lack of communication and perhaps too much
independence, I'd just put together a few frontend dependencies, used a
previously unknown Play Framework in the backend, and hoped for the best. It
wasn't a good way to do business, and I learned it the hard way. The project was
abandoned, and I managed to find a new job before the end of my contract. But to
this day I know to focus on a solution's quality and communicate clearly and
proactively.

## Technologies

I tend to pick up whatever is needed for the job, so this is not exhaustive. In
the age of LLMs, I don't think a list of technologies should matter that much -
but here it is, so that recruiters can stop bothering me.

-   **Current:** Go, Java, C++, TypeScript, Docker, Lua, Svelte, PostgreSQL,
    NixOS, Bazel, Git, Linux, Shell scripting, Protocol Buffers, tree-sitter,
    GCP, AI Agents
-   **Previous:** Scala, Kotlin, Dart, Python, JavaScript, Haskell, Spanner,
    Kubernetes, Flutter, ReactJS, Apache Spark, Puppet, Varnish, AWS

## Education

### Psychology, Bachelor of Science, SWPS University [10.2021-07.2024]{.date}

My wife and I both knew we would have to move to Warsaw at the end of the COVID
pandemic. Since we didn't want to get to know the city just through the work
environment, we decided to start pursuing second degrees. I chose psychology
because I wanted something completely unrelated to my day-to-day job. It turned
out to be perhaps more valuable than my computer science degree, in the context
of working in a large organization.

I completed the coursework over weekends and graduated while working full-time,
having my first child, and moving back to Wroclaw. My wife probably deserves
more credit than me for facilitating this. My main area of interest was social
and clinical psychology. If I ever suffer burnout as a software engineer, I'll
probably become a therapist for other software engineers.

### Philosophy, University of Wroclaw [09.2017-02.2018]{.date}

After starting my first corporate job, I quickly realized I needed some
counterbalance to my day-to-day life as a junior software engineer (or "Software
Engineering Specialist," if you believe the corporate hierarchy - the 2010s were
really good years to start a career in programming!). I had just graduated with
a degree in Computer Science. Since I didn't know exactly what I was looking
for, I chose whatever was the cheapest area of study.

I have to say, I thought it would be much easier. Philosophy is hard when you
actually try to understand it. I spent half a year taking classes, mostly
focusing on ancient Greek philosophy - Parmenides is my favorite. I ultimately
gave up when I started working at a small startup. I benefited greatly from this
adventure but it's not a story to write in a CV, even this one.

### Computer Science, Master of Engineering, Wroclaw University of Technology [10.2012-09.2017]{.date}

Thanks to my achievements in competitive programming in [high school], I was
eligible to pick any university in Poland to study Computer Science. This one
was not the best in the rankings, but it provided satisfactory coursework while
giving me enough free time to focus on my own interests.

I invested that time in an array of extracurricular activities:

-   Participated in [the first polish autonomous car project], designing the map
    module for the vehicle
-   Was a vice-president of my faculty's [student research group] (KNSI PWr)
-   Had a few internships abroad (Switzerland, UK)
-   Worked part-time in Nokia Networks and a local startup
-   Continued participation in programming contests and hackathons
-   Had probably the most fun time period of my life
-   Found myself in a group of people who would later develop very good careers
-   Watched almost all of Star Trek TV series

My favorite course was "programming languages and paradigms," where I learned
about functional programming for the first time. This started my journey with
Scala, Haskell, and even some more niche languages like Oz, Ada, and Prolog. I
was also fond of "algorithms and data structures," "architecture of computers,"
and "introduction to logic." Unfortunately, I had no exposure to AI-related
education.

I regularly received the rector's scholarship for the best students, taking 6th
place in my faculty's top 10 graduates ranking. I did not pursue a PhD because,
as my potential supervisor said, "I had enough motivation to start but not to
finish."

### Additional coursework and activities

-   Driving license for cars (2012) and motorcycles (2019), including special
    training in [driving in unsafe conditions] (2023). Nowadays, mostly getting
    around the city on a cargo bike and driving a car only when simracing.
-   Sailing license for smaller, motorless boats (2025), inspired by learning
    windsurfing as an additional university course (2015).
-   Individual singing lessons to improve speaking skills (2019).
-   Using NixOS since 2019, enjoying self-hosting.
-   Fond of mountain hiking.

  [AI hype]: https://ampcode.com
  [SCIP]: https://scip-code.org
  [an independent organization]: https://sourcegraph.com/blog/the-future-of-scip
  [a non-profit project]: https://blog.google/intl/en-mena/company-news/outreach-initiatives/micromentor-googleorg-mena/
  [external test infrastructure]: https://github.com/kubernetes/perf-tests
  [google/gtasks-md]: https://github.com/google/gtasks-md
  [Cloud logging]: https://cloud.google.com/blog/products/gcp/google-stackdriver-integrated-monitoring-and-logging-for-hybrid-cloud
  [GitHub repo with fabricated activity]: https://github.com/nokia/vault_keystone_plugin
  [promotional video]: https://www.youtube.com/watch?v=TDgdi282hk8
  [Spark Streaming]: https://spark.apache.org/docs/latest/streaming/index.html
  [FUGU]: http://sites.computer.org/debull/A15dec/p73.pdf
  [Amazon Sourcerer]: https://www.reuters.com/article/world/insight-amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK0AG/
  [HP Teamsite CRM]: https://en.wikipedia.org/wiki/TeamSite
  [myTOSA]: https://www.epfl.ch/innovation/domains/transportation/mobility/urban-and-suburban-mobility/mytosa-simulation-tool-for-the-optimization-of-a-catenary-free-electric-urban-transportation-system/
  [high school]: https://oi.edu.pl/contestants/Michał%20Kiełbowicz/
  [the first polish autonomous car project]: https://tvn24.pl/wroclaw/jurek-samochod-ktory-nie-potrzebuje-kierowcy-ra300800-ls3421628
  [student research group]: https://github.com/KNSI-WPPT
  [driving in unsafe conditions]: https://www.tormodlin.pl/szkolenia-firmowe/
