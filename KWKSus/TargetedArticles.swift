//
//  TargetedArticles.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 1/17/25.
//

import Foundation
import SwiftUI




struct TargetedArticles: Decodable {
    
    
    static let waterArticles: [NewsArticle] = [
        NewsArticle(
                    title: "AI's Challenging Waters",
                    description: "Fresh water is a precious and limited resource on our planet. Out of all the Earth's water, only 3% is fresh, and of that, a significant 2.5% is locked away in glaciers and polar ice caps making it inaccessible. This leaves just 0.5% of the planet’s water readily available to meet the needs of a growing global population alongside the rising demands from agriculture and industry. When the demand for freshwater surpasses the available supply needed to meet both human and ecological needs, we experience water stress. According to the UN-Water program, in 2021, approximately 10% of the global population - 720 million people - lived in countries with high and critical water stress levels.",
                    url: "https://cee.illinois.edu/news/AIs-Challenging-Waters",
                    urlToImage: "https://cee.illinois.edu/_sitemanager/viewphoto.aspx?id=97296&s=1600",
                    author: "Ana Pinheiro Privette",
                    publishedAt: "2024-10-11"
                ),
        NewsArticle(
                    title: "Explained: Generative AI’s environmental impact",
                    description: "Rapid development and deployment of powerful generative AI models comes with environmental consequences, including increased electricity demand and water consumption.",
                    url: "https://news.mit.edu/2025/explained-generative-ai-environmental-impact-0117",
                    urlToImage: "https://news.mit.edu/sites/default/files/styles/news_article__image_gallery/public/images/202501/MIT-AI-Climate-01_0.jpg?itok=kXVLyp49",
                    author: "Adam Zewe",
                    publishedAt: "2025-1-20"
                ),
        NewsArticle(
                    title: "The Rise of AI in Water and Wastewater Management: Ensuring a Sustainable Future",
                    description: "In an era where artificial intelligence (AI) is revolutionizing sectors across the board, its application within water and wastewater management is demonstrating the power of smart technology to secure a resilient future. AI's role in enhancing the efficiency and reliability of water utilities is not just an advancement but a necessity, given the growing complexity and demands of modern societies. This exploration isn't about a single entity's contribution but about how AI is emerging as a crucial player in this vital industry.",
                    url: "https://www.nacwa.org/news-publications/news-detail/2023/11/16/the-rise-of-ai-in-water-and-wastewater-management-ensuring-a-sustainable-future",
                    urlToImage: "https://www.nacwa.org/images/default-source/default-album/treatment.png?sfvrsn=e240c361_0&MaxWidth=650&MaxHeight=&ScaleUp=false&Quality=High&Method=ResizeFitToAreaArguments&Signature=B9C0D0E27F304F93DB54339821028ECD15943F3C",
                    author: "Mahesh Lunani",
                    publishedAt: "2023-11-16"
                ),
        NewsArticle(
                    title: "Water AI: 8 Ways AI in Water Management Creates a Better Future",
                    description: "Climate change and population growth place increasing burdens on water supplies and infrastructure all over the world. Although millions of people are mindful of water-related challenges, the water cycle remains a mystery, even to the people charged with understanding how water moves on, above and below the surface.",
                    url: "https://www.sandtech.com/insight/water-ai-8-ways-ai-in-water-management-creates-a-better-future/",
                    urlToImage: "https://www.sandtech.com/wp-content/uploads/2024/05/Insights-Banner-Water-AI.jpg",
                    author: "Ross McIntosh",
                    publishedAt: "2024-5-3"
                ),
        NewsArticle(
                    title: "AI’s craving for data is matched only by a runaway thirst for water and energy",
                    description: "The computing power for AI models requires immense – and increasing – amounts of natural resources. Legislation is required to prevent environmental crisis",
                    url: "https://www.theguardian.com/commentisfree/2024/mar/02/ais-craving-for-data-is-matched-only-by-a-runaway-thirst-for-water-and-energy",
                    urlToImage: "https://i.guim.co.uk/img/media/12576f906a47ff23877c1d6676c8e5890e80df37/0_160_4800_2880/master/4800.jpg?width=620&dpr=2&s=none&crop=none",
                    author: "John Naughton",
                    publishedAt: "2024-3-2"
                ),
        NewsArticle(
                    title: "A bottle of water per email: the hidden environmental costs of using AI chatbots",
                    description: "AI bots generate a lot of heat, and keeping their computer servers running exacts a toll.",
                    url: "https://www.washingtonpost.com/technology/2024/09/18/energy-ai-use-electricity-water-data-centers/",
                    urlToImage: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/BOR2WUR2LRHGDOUPFKR52TVUKE.png&w=1440&impolicy=high_res",
                    author: "Pranshu Verma and Shelly Tan",
                    publishedAt: "2024-9-18"
                ),
        NewsArticle(
                    title: "What we can VERIFY about AI and its environmental impact",
                    description: "The boom in AI has led to a boom in AI data centers. Several readers asked us to VERIFY how these hubs use water and electricity.",
                    url: "https://www.firstcoastnews.com/article/news/verify/ai/ai-electricity-water-use-chatgpt-google-la-fire-fact-check/536-85df815e-4212-4f2d-87bd-f5dd4e8f5eff",
                    urlToImage: "https://media.firstcoastnews.com/assets/VERIFY/images/d043bf3b-0b26-4d04-b1d5-06631f2e51cd/20250117T192048/d043bf3b-0b26-4d04-b1d5-06631f2e51cd_1920x1080.jpg",
                    author: "Emery Winter",
                    publishedAt: "2025-1-17"
                )
    ]
    
    
    static let powerArticles: [NewsArticle] = [
        NewsArticle(
                    title: "As Use of A.I. Soars, So Does the Energy and Water It Requires",
                    description: "Generative artificial intelligence uses massive amounts of energy for computation and data storage and millions of gallons of water to cool the equipment at data centers. Now, legislators and regulators — in the U.S. and the EU — are starting to demand accountability.",
                    url: "https://e360.yale.edu/features/artificial-intelligence-climate-energy-emissions",
                    urlToImage: "https://e360.yale.edu/assets/site/_1260x709_crop_center-center/Guian-Data-Center_Getty-2.jpg",
                    author: "David Berreby",
                    publishedAt: "2024-2-6"
                ),
        NewsArticle(
                    title: "AI is poised to drive 160% increase in data center power demand",
                    description: "On average, a ChatGPT query needs nearly 10 times as much electricity to process as a Google search. In that difference lies a coming sea change in how the US, Europe, and the world at large will consume power — and how much that will cost. ",
                    url: "https://www.goldmansachs.com/insights/articles/AI-poised-to-drive-160-increase-in-power-demand",
                    urlToImage: "https://www.goldmansachs.com/images/migrated/insights/pages/articles/ai-is-poised-to-drive-160-increase-in-data-center-power-demand/800x450.jpg",
                    author: "Goldman Sachs",
                    publishedAt: "2024-5-14"
                ),
        NewsArticle(
                    title: "Artificial Intelligence for Energy",
                    description: "The Department of Energy is committed to building an abundant, secure, and resilient energy future for the nation. This requires an upgrade of our energy systems—from how we generate and store energy to how we deliver it to consumers. AI is an essential tool to navigate the complexities of this transition, accelerating innovation and improving efficiency and reliability. DOE is at the forefront of applying AI to address key challenges across the energy sector",
                    url: "https://www.energy.gov/topics/artificial-intelligence-energy",
                    urlToImage: "https://www.energy.gov/sites/default/files/2024-11/AI%20Banner.jpeg",
                    author: "US Department of Energy",
                    publishedAt: ""
                ),
        NewsArticle(
                    title: "AI has high data center energy costs — but there are solutions",
                    description: "AI workloads have sent data center emissions skyrocketing. An MIT expert details ways to reduce energy use and promote sustainable AI.",
                    url: "https://mitsloan.mit.edu/ideas-made-to-matter/ai-has-high-data-center-energy-costs-there-are-solutions",
                    urlToImage: "",
                    author: "Beth Stackpoley",
                    publishedAt: "2025-1-7"
                ),
        NewsArticle(
                    title: "AI's energy dilemma: Challenges, opportunities, and a path forward",
                    description: "The energy demand of data centres, including hyper-scale facilities and micro edge deployments, is projected to grow from 1% in 2022 to over 3% by 2030.",
                    url: "https://www.weforum.org/stories/2025/01/ai-energy-dilemma-challenges-opportunities-and-path-forward/",
                    urlToImage: "https://assets.weforum.org/article/image/large_gJ4SsyzqiheB-7BthRlS0RgU71CBbP3WkHjlGVXY5u4.jpg",
                    author: "Ginelle Greene-Dewasmes and Thapelo Tladi",
                    publishedAt: "2025-1-21"
                ),
        NewsArticle(
                    title: "Generative AI is an energy hog. Is the tech worth the environmental cost?",
                    description: "AI is on track to be paradigm-shifting tech, but its harms could outweigh any benefits",
                    url: "https://www.sciencenews.org/article/generative-ai-energy-environmental-cost",
                    urlToImage: "https://i0.wp.com/www.sciencenews.org/wp-content/uploads/2024/12/121424_YE-ai-energy_feat.jpg?w=1440&ssl=1",
                    author: "Lauren Leffer",
                    publishedAt: "2024-12-9"
                ),
        NewsArticle(
                    title: "Can sustainable AI practices overcome the problem of AI’s power consumption?",
                    description: "The digital shift promised a greener economy, but AI’s energy demands are straining grids. Sustainable AI practices, infrastructure investments, and optimized models are essential to ensure a net-zero future without compromising technological growth.",
                    url: "https://www.autodesk.com/design-make/articles/sustainable-ai-practices",
                    urlToImage: "https://images.ctfassets.net/v7wr16nrr0mz/1syf6oz0FvBhC7pyCK3fR5/d01c355568ef41e75d554a5f95832dde/sustainable-ai-practices-banner-1920x1080.jpg?w=1600&h=900&fit=fill&f=center&fm=webp",
                    author: "Mark de Wolf",
                    publishedAt: "2024-7-8"
                ),
        NewsArticle(
                    title: "AI is driving a massive power suck on the grid. Can AI also help relieve it?",
                    description: "Data centers for power-hungry generative AI are straining the energy grid, but a different kind of AI might help.",
                    url: "https://www.emergingtechbrew.com/stories/2024/09/18/ai-electric-grid-data-centers",
                    urlToImage: "https://cdn.sanity.io/images/bl383u0v/production/8551acdcbc7adcba9d0fd90fb310c1f10867bc33-1500x1000.png?w=900&h=600&q=100&fit=max&auto=format&dpr=2",
                    author: "Patrick Kulp",
                    publishedAt: "2024-9-18"
                )
        
    ]
    
    static let climateArticles: [NewsArticle] = [
        NewsArticle(
                    title: "Can AI Help Save Our Planet?",
                    description: "",
                    url: "https://news.climate.columbia.edu/2024/09/19/can-ai-help-save-our-planet/",
                    urlToImage: "https://media.news.climate.columbia.edu/wp-content/uploads/2024/09/Pierre_Gentine-NEW.avif",
                    author: "Pierre Gentine",
                    publishedAt: "2024-9-19"
                ),
        NewsArticle(
                    title: "Is AI the intelligent answer to climate change?",
                    description: "Artificial Intelligence (AI) has been hailed as a great game changer for addressing climate change, but scientists are concerned that the technology’s environmental footprint is large. Researcher Felippa Amanta, a DPhil at the ECI, takes a look at the ‘double-edged sword’ in this article published in The Conversation.",
                    url: "https://www.eci.ox.ac.uk/news/ai-intelligent-answer-climate-change",
                    urlToImage: "https://www.eci.ox.ac.uk/sites/default/files/styles/news_style_16x9/public/2024-02/file-20240125-27-18nqs5.png?itok=Z60bNlSi",
                    author: "Felippa Amanta",
                    publishedAt: "2024-2-27"
                ),
        NewsArticle(
                    title: "What opportunities and risks does AI present for climate action?",
                    description: "The net zero transition and the digital transformation are the two most powerful forces of the 21st century. There are promising signs that artificial intelligence (AI) can support climate action, but at the same time, it carries risks: AI is energy-intensive to run and the ways in which it is applied could exacerbate social and economic inequalities. These economic and technological transformations need to be harnessed in a way that supports just, fair and inclusive economic development.",
                    url: "https://www.lse.ac.uk/granthaminstitute/explainers/what-opportunities-and-risks-does-ai-present-for-climate-action/",
                    urlToImage: "https://www.lse.ac.uk/granthaminstitute/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2023/07/data-centre-rawpixel-id-5906639-jpeg-e1688482262602-800x450.jpg.webp",
                    author: "Danae Kyriakopoulou",
                    publishedAt: "2023-7-4"
                ),
        NewsArticle(
                    title: "AI’s Climate Impact Goes beyond Its Emissions",
                    description: "To understand how AI is contributing to climate change, look at the way it’s being used",
                    url: "https://www.scientificamerican.com/article/ais-climate-impact-goes-beyond-its-emissions/",
                    urlToImage: "https://static.scientificamerican.com/sciam/cache/file/12E32AA7-B4DC-4A82-9864D1B7D2078B52_source.jpg?w=1350",
                    author: "Jude Coleman",
                    publishedAt: "2023-12-7"
                ),
        NewsArticle(
                    title: "Artificial Intelligence – Help or Harm for the Climate?",
                    description: "Is AI a climate hero or a hidden villain? AI could both help and harm the environment, so smart and green policies are essential.",
                    url: "https://unu.edu/ehs/series/artificial-intelligence-help-or-harm-climate",
                    urlToImage: "https://unu.edu/sites/default/files/styles/content_width/public/2024-09/Inline%20Media%20%E2%80%93%20Single%20Image%20944x531px%20%2837%29.webp?itok=bK2ULgMf",
                    author: "Himanshu Shekhar and Soenke Kreft",
                    publishedAt: "2024-9-28"
                ),
        NewsArticle(
                    title: "The carbon impact of artificial intelligence",
                    description: "The part that artificial intelligence plays in climate change has come under scrutiny, including from tech workers themselves who joined the global climate strike last year. Much can be done by developing tools to quantify the carbon cost of machine learning models and by switching to a sustainable artificial intelligence infrastructure.",
                    url: "https://www.nature.com/articles/s42256-020-0219-9",
                    urlToImage: "https://media.springernature.com/lw703/springer-static/image/art%3A10.1038%2Fs42256-020-0219-9/MediaObjects/42256_2020_219_Figa_HTML.jpg?as=webp",
                    author: "Payal Dhar",
                    publishedAt: "2020-8-12"
                ),
        NewsArticle(
                    title: "AI Has a Huge Climate Change Problem",
                    description: "When it comes to the climate crisis, AI is a part of the problem. But it can also be part of the solution. Take a closer look at the environmental costs of AI, its potential upsides and how it can contribute to a greener future.",
                    url: "https://builtin.com/artificial-intelligence/ai-climate-change-dilemma",
                    urlToImage: "https://cdn.builtin.com/cdn-cgi/image/f=auto,fit=cover,w=1200,h=635,q=80/https://builtin.com/sites/www.builtin.com/files/2023-06/Untitled%20design_1.png",
                    author: "Matthew Urwin",
                    publishedAt: "2024-11-27"
                )

    ]
}
