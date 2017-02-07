module PagesCollectionViewAddons
  def filter(tag)
    page_with_tag = []
    all.each { | page |
      tags = page.tags.map { |x| x['name'].downcase }
      if tags.include?(tag.downcase)
         page_with_tag.push(page)
      end
    }
    return page_with_tag
  end

  def talk_filter
      filter('talk')
  end
end
Ruhoh.collection('posts').send(:include, PagesCollectionViewAddons)
