class CategoryService

    def perform
      generate_actual_categories.each do |cat|
        Category.create!(name: cat)
      end
    end 

  def generate_actual_categories
    possible_categories = generate_possible_categories
    wikipedia_categories = generate_wikipedia_categories
    actual_categories = []
    
    wikipedia_categories.each do |w_cat|
      actual_categories.push(w_cat) if possible_categories.include?(w_cat)
    end

    actual_categories.push("Gym")
    actual_categories.push("Pharmacies")
    
    return actual_categories
  end

  def generate_wikipedia_categories
    wikipedia_categories_doc = get_doc("https://en.wikipedia.org/wiki/List_of_hobbies")
    return wikipedia_categories = wikipedia_categories_doc.search('.mw-parser-output .div-col ul li > a').map(&:text)
  end

  def generate_possible_categories
    possible_categories_doc = get_doc("https://blog.yelp.com/2018/01/yelp_category_list")
    return possible_categories = possible_categories_doc.search('.entry-content ul li span').map(&:text)
  end

  def get_doc(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    return html_doc
  end
end 