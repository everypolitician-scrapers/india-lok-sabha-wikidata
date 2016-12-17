#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_16th_Lok_Sabha',
  xpath: '//table[.//th[.="Constituency"]]//tr/td[2]//a[not(@class="new")]/@title',
)

by_category = WikiData::Category.new( 'Category:16th Lok Sabha members', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names | by_category })
