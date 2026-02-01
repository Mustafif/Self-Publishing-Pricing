#import "utils.typ": todo, definition
= Introduction

As e-books have become increasingly popular among Canadian readers, in this day and age it is also increasingly easier to become your own author as well. Gone are the days where one needs to be found by a publisher, get pennies on the dollar for the work you've done; now it is very easy to become your own self-published author. 

Being a self-published means all aspects of the publishing and distribution process of your publication is now under your control. In Canada, original works such as publications have an implicit copyright with the author #cite(<government_of_canada_copyright_2023>) and it lasts throughout your life and an additional 70 years after that. The United States also follows similarly, however in both countries if you're looking to enforce the rights in court then it must be registered by the respective copyright office #cite(<government_of_canada_copyright_2023>). 

Since you automatically own the copyright once the publication has been published. The main concern you have when self-publishing a book is setting the prices across platforms; the platforms in question are ones which offer a direct publishing model or DIY model. Common platforms which offer this service is Amazon's Kindle Direct Publishing service, Google Play Books Partner Centre, which provide a platform to upload your manuscript, set prices, and easily publish your book on their platform, each of them provide a royalty rate which is a split percentage of how much you earn from the sale. Some of these platforms only offer publishing in e-book format (eg. Google Books, Kobo), and others provide print formats like paperback or hard-cover (Kindle Direct, B&N Press) as well. 

While platforms like Kindle Direct Publishing do offer a free ISBN option, you can also use the Government of Canada's Library and Archive department to get your own ISBN's #cite(<canada_about_2025>) free of charge. This is something that would cost $\$125$ USD in the United States, and typically for a book you would require one ISBN for each format you plan on releasing it on (ebook, paperback, hardcover) #cite(<myid50_super_admin_buy_2019>).


Our motivation in this paper is to foucs on the world of direct self-publishing in the Canadian market. As discussed, in Canada it is very accessible to become a self-published author, and this paper acts as a guide to find the most optimal prices for your books and maximizing revenue across all of the platforms you wish to publish your book on.




// Our motivation in this paper is to focus on the world of Direct or Do-It-Yourself (DIY) self publishing in the Canadian market. In Canada it is very accessible to become a self-published author, with platforms like Kindle Direct Publishing, the B&N Press, you are able to upload a manuscript you wrote and sell your book in different formats like an ebook, paperback, hard-cover in a very intuitive way. This paper acts a guide to maximize revenue across these platforms that offer similar services, but have varying royalty rates, market share/quality, etc.

// While platforms like Kindle Direct Publishing do offer a free ISBN option, you can also use the Goverment of Canada's Library and Archive department to get your own ISBN's #cite(<canada_about_2025>) free of charge which is something that would cost $\$125$ USD in the United States, and typically for a book you would require one ISBN for each format you plan on releasing it on (ebook, paperback, hardcover) #cite(<myid50_super_admin_buy_2019>).


== Literary Review
#include "literary_review.typ"



// #todo([
//   Introduce the purpose of this paper, and our motivation behind it, we should discuss the gap in the research and our end goal.

//   Include motivation as being an author in Canada is very easy to do, and affordable, with free ISBN's offered by the Library and Archive department, where in US it can cost hundreds for ISBN's.
// ])

// In this paper we focus on the world of self publishers who have the dubious task of pricing their own books they'd like to sell across multiple platforms. In this paper we focus exclusively on ebooks, however this model or idea can be easily extended to handle paperback/hard-cover pricing however the printing costs from a platform will need to be accounted as well, whereas in ebooks the file-size download costs are negligible.

// We will first discuss about the objective function that we use in our model, the reasoning behind how we maximize revenue using the price, royalty rate and accounting demand by attractiveness, then we discuss on testing the correctness and robustness of our model through scenario testing and lastly we will use empirical data to determine the optimal prices for books published under the MoKa Reads Collective and the platforms that the publications will be published on.

#todo([
  Maybe add a small literary review or some papers similar to our idea, however we focus exclusively on the world of self publishing and ebooks, not wholesale selling or book businesses.
])

// #todo([
//   Figure out where to discuss our assumptions:
//   1. We assume the population is aware of the book, and will decide if they want to purchase it or not at a particular platform
//   2. We assume that some consumers are lost and decide to not purchase our book at all
//   3. We assume platforms that provide lower royalty rates but have a dominant market share will experience low price sensitivity due to their dominance.
//   4. We assume a platform that has high royalty rates but a very small market share will experience high price sensitivity due to their need to compete by price more than quality against dominant players.

//   // We also could mention what we define as a dominant platform as:
//   // Platform $delta$ is considered a dominant platform if:
//   // - $alpha_delta = max(bold(alpha))$
//   // - $r_delta = min(bold(r))$

//   // Then we can assume then $beta_delta = min(bold(delta))$
// ])
