class Seed

  def self.begin
    seed = Seed.new
    seed.destroy_old_data
    seed.generate_products
  end

  def destroy_old_data
    OrderItem.destroy_all
    Order.destroy_all
    Book.destroy_all
    Title.destroy_all
  end



  def generate_products
    categoryList =['Science fiction','Essay','Narrative non-fiction Books','Metafiction','Realistic fiction','Fantasy','Suspense/Thriller','Biography/Autobiography','Fairy tale','Crime/Detective','Fanfiction','Tall tale','Comic/Graphic Novel','Mythopoeia']

  categoryList.each do |category|
      title = Title.create!(
                    title: category
                  )
      10.times do |i|
        book = title.books.create!(
                name: Faker::Book.title,
                page_count: Faker::Number.between(50, 500),
                author: Faker::Book.author,
                publisher: Faker::Book.publisher,
                recently_added: 'yes',
                cover: open('public/images/smaple.png')
              )
      end
    end
  end
end

Seed.begin
