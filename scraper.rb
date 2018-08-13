#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_16th_Lok_Sabha',
  xpath: '//table[.//th[contains(.,"Constituency")]]//tr/td[2]//a[not(@class="new")]/@title',
)

by_category = WikiData::Category.new( 'Category:16th Lok Sabha members', 'en').member_titles

sparq = 'SELECT DISTINCT ?item WHERE { ?item p:P39 [ ps:P39 wd:Q16556694 ; pq:P2937 wd:Q15978395 ] }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { en: names | by_category })
