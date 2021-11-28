Supplier.create!([{name: "Good Stuff", email: "goodstuff@email.com", phone_number: "345-432-6777"}, {name: "Cool Coffee", email: "coffee@cool.com", phone_number: "111-222-3333"}])

Product.create!([
  {name: "Spilt Delight", price: 74, supplier_id: 1, description: "structured, big, mint, sundried tomato, clove"},
  {name: "Split Java", price: 64, supplier_id: 2, description: "wild, full, pecan, burnt sugar, green apple"},
  {name: "Morning Pie", price: 53, supplier_id: 2, description: "quick, full, raspberry, leafy greens, hibiscus"},
  {name: "Wake-up Symphony", price: 12, supplier_id: 1, description: "lingering, silky, honeydew, tomato, vanilla"},
  {name: "Heart Light", price: 74, supplier_id: 2, description: "sharp, silky, dates, lime, mint"},
  {name: "Veranda Mug", price: 42, supplier_id: 1, description: "dirty, big, lychee, hay, leathery"},
  {name: "Captain's Town", price: 47, supplier_id: 1, description: "crisp, chewy, green-tea, marshmallow, corriander"},
  {name: "Seattle Delight", price: 59, supplier_id: 2, description: "unbalanced, watery, black pepper, lavender, olive"},
  {name: "Melty Enlightenment", price: 13, supplier_id: 2, description: "pointed, coating, tomato, lemonade, red apple"},
  {name: "Wake-up Level", price: 87, supplier_id: 2, description: "balanced, silky, soil, nutella, raspberry"},
  {name: "Normal Coffee", price: 12, supplier_id: 1, description: "just coffee"},
  {name: "Bland Coffee", price: 21, supplier_id: 1, description: "bland coffee"}
])




