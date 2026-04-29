DROP DATABASE IF EXISTS clothing_brand;
CREATE DATABASE clothing_brand;
USE clothing_brand;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    image_url VARCHAR(500),
    sizes VARCHAR(100),
    colors VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Orders Table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
    shipping_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Order Items Table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    size VARCHAR(10),
    color VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Cart Table
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    size VARCHAR(10),
    color VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Categories
INSERT INTO categories (name, description) VALUES
('T-Shirts', 'Casual and formal t-shirts'),
('Hoodies', 'Warm and comfortable hoodies'),
('Jackets', 'Stylish jackets for all seasons'),
('Trousers', 'Comfortable trousers and pants'),
('Accessories', 'Caps, bags and more'),
('Shorts', 'Comfortable shorts for casual and active wear'),
('Sweatshirts', 'Warm and stylish sweatshirts'),
('Joggers', 'Comfortable joggers for everyday wear'),
('Caps & Hats', 'Stylish headwear collection'),
('Bags', 'Backpacks, tote bags and more');

-- Products
INSERT INTO products (category_id, name, description, price, stock_quantity, image_url, sizes, colors) VALUES
(1, 'Essential Black Tee', 'A wardrobe staple. Our essential black tee is crafted from 100% premium organic cotton for ultimate comfort. Features a relaxed fit with reinforced stitching for long-lasting durability. Perfect for any casual occasion.', 18.99, 120, 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990', 'XS,S,M,L,XL,XXL', 'Black'),
(1, 'Vintage Wash Tee', 'Experience the look and feel of a well-loved classic with our vintage wash tee. Pre-washed for a soft, broken-in feel right out of the box. Slightly oversized fit for that effortless street style look.', 22.99, 85, 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a', 'S,M,L,XL', 'Washed Grey,Washed Blue,Washed Black'),
(1, 'Oversized Logo Tee', 'Make a statement with our oversized logo tee. Features our signature Urban Threads logo printed on the chest. Made from heavyweight cotton for a premium feel and structured silhouette.', 26.99, 95, 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9', 'S,M,L,XL,XXL', 'White,Black,Sand,Forest Green'),
(1, 'Striped Polo Shirt', 'Elevate your casual wardrobe with our striped polo shirt. Classic polo collar with two-button placket. Made from breathable cotton pique fabric perfect for warm days.', 34.99, 60, 'https://images.unsplash.com/photo-1576566588028-4147f3842f27', 'S,M,L,XL', 'Navy/White,Black/White,Red/White'),
(1, 'Long Sleeve Henley', 'A versatile piece that works for any season. Our long sleeve henley features a classic three-button placket and ribbed cuffs. Made from soft cotton blend fabric for all-day comfort.', 28.99, 70, 'https://images.unsplash.com/photo-1602810316498-ab67cf68c8e1', 'S,M,L,XL,XXL', 'White,Navy,Burgundy,Olive'),
(1, 'Tie-Dye Tee', 'Stand out from the crowd with our vibrant tie-dye tee. Each piece is uniquely dyed by hand making every item one of a kind. Relaxed fit in soft 100% cotton.', 24.99, 45, 'https://images.unsplash.com/photo-1562157873-818bc0726f68', 'S,M,L,XL', 'Blue/Purple,Pink/Orange,Green/Yellow'),
(1, 'Pocket Detail Tee', 'Simple but refined. Our pocket detail tee features a small chest pocket for a clean, minimalist look. Made from lightweight cotton jersey that drapes beautifully.', 19.99, 110, 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b', 'XS,S,M,L,XL', 'White,Light Grey,Navy,Sage Green'),
(1, 'Acid Wash Tee', 'Channelling 90s streetwear vibes, our acid wash tee gives you that underground look. Heavyweight cotton with a relaxed boxy fit. A must-have for any streetwear enthusiast.', 27.99, 55, 'https://images.unsplash.com/photo-1503342394128-c104d54dba01', 'S,M,L,XL', 'Black,Grey,Blue'),
(2, 'Classic Pullover Hoodie', 'The ultimate comfort piece. Our classic pullover hoodie is made from a premium cotton-polyester blend with a brushed fleece interior. Features a kangaroo pocket, adjustable drawstring hood and ribbed cuffs.', 44.99, 75, 'https://images.unsplash.com/photo-1556821840-3a63f15732ce', 'XS,S,M,L,XL,XXL', 'Black,Grey,Navy,White,Forest Green'),
(2, 'Zip-Up Hoodie', 'A versatile layering piece for any season. Our zip-up hoodie features a full-length zip, dual side pockets and a lined hood. Made from soft fleece fabric for warmth and comfort.', 54.99, 60, 'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633', 'S,M,L,XL,XXL', 'Black,Charcoal,Navy,Burgundy'),
(2, 'Oversized Cropped Hoodie', 'The perfect streetwear essential. Our oversized cropped hoodie hits at the hip for a modern silhouette. Features dropped shoulders and an extra-wide hood for maximum style points.', 48.99, 50, 'https://images.unsplash.com/photo-1578681994506-b8f463449011', 'XS,S,M,L', 'Pink,Lavender,Baby Blue,White,Black'),
(2, 'Heavyweight Hoodie', 'Built to last, our heavyweight hoodie is crafted from 400gsm cotton fleece for serious warmth. Features a thick hood with flat drawstring and double-stitched seams throughout.', 62.99, 40, 'https://images.unsplash.com/photo-1542219550-37153d387c27', 'S,M,L,XL,XXL,3XL', 'Black,Ecru,Army Green,Navy'),
(2, 'Embroidered Logo Hoodie', 'Our signature hoodie elevated with premium embroidery. The Urban Threads logo is embroidered on the chest and hood for a subtle yet luxurious finish. Made from premium cotton blend.', 58.99, 65, 'https://images.unsplash.com/photo-1509942774463-acf339cf87d5', 'S,M,L,XL,XXL', 'Black,Navy,Cream,Forest Green'),
(2, 'Sherpa Lined Hoodie', 'Stay warm in our sherpa lined hoodie. Features a cosy sherpa fleece interior with a smooth exterior shell. Perfect for cold days when you need serious warmth without sacrificing style.', 69.99, 35, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea', 'S,M,L,XL', 'Brown,Grey,Black,Tan'),
(3, 'Classic Denim Jacket', 'A timeless classic reinvented for the modern wardrobe. Our classic denim jacket features a traditional silhouette with chest pockets, side pockets and button-up front. Made from premium 12oz denim.', 79.99, 45, 'https://images.unsplash.com/photo-1576871337622-98d48d1cf531', 'XS,S,M,L,XL', 'Light Wash,Mid Wash,Dark Wash,Black'),
(3, 'Windbreaker Jacket', 'Ready for any weather, our windbreaker jacket is made from lightweight ripstop fabric with a water-resistant coating. Features a packable design, elasticated cuffs and a drawstring hem.', 74.99, 50, 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f', 'S,M,L,XL,XXL', 'Black,Navy,Red,Yellow,Olive'),
(3, 'Leather Biker Jacket', 'Make a bold statement with our leather biker jacket. Crafted from high-quality genuine leather with an asymmetric zip, snap lapels and multiple pockets. A true investment piece that only gets better with age.', 199.99, 20, 'https://images.unsplash.com/photo-1551028719-00167b16eac5', 'XS,S,M,L,XL', 'Black,Brown,Tan'),
(3, 'Quilted Puffer Jacket', 'Stay warm in style with our quilted puffer jacket. Features 550-fill down insulation, a water-resistant shell and a packable design. Lightweight yet incredibly warm, perfect for cold weather adventures.', 119.99, 35, 'https://images.unsplash.com/photo-1547624643-3bf761b09502', 'XS,S,M,L,XL,XXL', 'Black,Navy,Forest Green,Burgundy,Camel'),
(3, 'Coach Jacket', 'Inspired by the classic coaching jacket, this piece features a snap button front, ribbed collar, cuffs and hem. Lightweight and perfect for layering. A streetwear essential.', 84.99, 40, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea', 'S,M,L,XL', 'Black,Navy,Red,Cream'),
(3, 'Sherpa Trucker Jacket', 'Our sherpa trucker jacket combines the classic denim trucker silhouette with a cosy sherpa interior. The perfect transition jacket for the cooler months. Features chest and side pockets.', 99.99, 30, 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3', 'S,M,L,XL', 'Light Denim,Dark Denim,Black'),
(3, 'MA-1 Flight Jacket', 'Based on the iconic US military flight jacket, our MA-1 features a nylon shell, orange lining and a rib-knit collar, cuffs and hem. A timeless piece with serious style credentials.', 109.99, 25, 'https://images.unsplash.com/photo-1548126032-079a0fb0099d', 'S,M,L,XL,XXL', 'Olive,Black,Navy,Sage'),
(4, 'Cargo Trousers', 'Functional meets fashionable with our cargo trousers. Features multiple utility pockets, a relaxed fit through the hip and thigh, and a tapered leg. Made from durable cotton canvas.', 54.99, 65, 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a', '28,30,32,34,36,38', 'Olive,Black,Khaki,Navy'),
(4, 'Relaxed Fit Jeans', 'Our relaxed fit jeans offer a comfortable, laid-back silhouette without looking sloppy. Made from premium stretch denim with a slight taper at the ankle. Perfect for everyday wear.', 59.99, 80, 'https://images.unsplash.com/photo-1542272604-787c3835535d', '28,30,32,34,36', 'Light Wash,Dark Wash,Black,Grey'),
(4, 'Skinny Jeans', 'Our skinny jeans are cut close to the body from ankle to waist for a sleek, modern silhouette. Made from stretch denim with just enough give for all-day comfort.', 54.99, 70, 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246', '28,30,32,34,36', 'Black,Dark Wash,Light Wash,Grey'),
(4, 'Straight Leg Trousers', 'A versatile wardrobe essential. Our straight leg trousers feature a clean, modern cut that works for both casual and smart casual occasions. Made from premium cotton blend fabric.', 49.99, 55, 'https://images.unsplash.com/photo-1594938298603-c8148c4b4087', '28,30,32,34,36,38', 'Black,Navy,Grey,Camel,Cream'),
(4, 'Corduroy Trousers', 'Rich in texture and timeless in style, our corduroy trousers are a seasonal must-have. Wide-wale cord in a relaxed fit with a straight leg. Made from soft cotton corduroy.', 59.99, 40, 'https://images.unsplash.com/photo-1604176354204-9268737828e4', '28,30,32,34,36', 'Tan,Forest Green,Burgundy,Navy,Black'),
(4, 'Wide Leg Trousers', 'Make a bold statement with our wide leg trousers. A dramatic silhouette with a high waist and wide leg opening. Made from lightweight woven fabric that moves beautifully.', 64.99, 35, 'https://images.unsplash.com/photo-1609501676725-7186f017a4b7', 'XS,S,M,L,XL', 'Black,Cream,Navy,Camel'),
(5, 'Classic Snapback Cap', 'Complete any outfit with our classic snapback cap. Features a structured crown, flat brim and adjustable snapback closure. Embroidered with our Urban Threads logo on the front.', 22.99, 100, 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b', 'One Size', 'Black,White,Navy,Red,Forest Green'),
(5, 'Beanie Hat', 'Keep warm in style with our classic beanie hat. Made from a soft acrylic blend with a folded cuff and our embroidered logo. One size fits most with a comfortable stretch fit.', 18.99, 120, 'https://images.unsplash.com/photo-1576871337622-98d48d1cf531', 'One Size', 'Black,Grey,Navy,Cream,Forest Green,Burgundy'),
(5, 'Bucket Hat', 'The ultimate streetwear accessory. Our bucket hat features a wide brim for sun protection and our embroidered logo on the front. Made from durable cotton twill.', 24.99, 80, 'https://images.unsplash.com/photo-1521369909029-2afed882baee', 'S/M,L/XL', 'Black,Beige,Olive,Navy,White'),
(5, 'Canvas Tote Bag', 'Sustainable and stylish. Our heavyweight canvas tote bag is perfect for everyday use. Features long handles, an interior pocket and our Urban Threads logo screen printed on the front.', 19.99, 90, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62', 'One Size', 'Natural,Black,Navy'),
(5, 'Crossbody Bag', 'A versatile everyday carry. Our crossbody bag features a main zip compartment, front pocket and adjustable strap. Made from durable nylon with metal hardware.', 39.99, 50, 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa', 'One Size', 'Black,Brown,Olive,Navy'),
(5, 'Backpack', 'Our urban backpack is designed for everyday life. Features a padded laptop sleeve, multiple pockets, padded shoulder straps and back panel. Made from water-resistant nylon. Holds up to 25 litres.', 64.99, 40, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62', 'One Size', 'Black,Navy,Grey,Forest Green'),
(5, 'Leather Belt', 'A quality leather belt that will last for years. Made from full-grain leather with a classic pin buckle in antique silver. 35mm width. Available in multiple lengths.', 29.99, 60, 'https://images.unsplash.com/photo-1624222247344-550fb60583dc', 'S,M,L,XL', 'Black,Brown,Tan'),
(5, 'Sunglasses', 'Protect your eyes in style. Our signature sunglasses feature UV400 protection lenses in a classic frame shape. Lightweight and comfortable with a durable acetate frame.', 34.99, 70, 'https://images.unsplash.com/photo-1511499767150-a48a237f0083', 'One Size', 'Black,Tortoise,Clear,Brown'),
(6, 'Mesh Basketball Shorts', 'Inspired by the court, made for the streets. Our mesh basketball shorts feature an elasticated waistband with drawstring, side pockets and a relaxed fit. Made from lightweight mesh fabric.', 29.99, 75, 'https://images.unsplash.com/photo-1591195853828-11db59a44f43', 'S,M,L,XL,XXL', 'Black,White,Navy,Red,Forest Green'),
(6, 'Chino Shorts', 'Our chino shorts are a summer wardrobe essential. Made from lightweight cotton twill with a slim fit through the hip and thigh. Features two front pockets and two back pockets.', 34.99, 65, 'https://images.unsplash.com/photo-1562886877-f75a9b9e8b95', '28,30,32,34,36', 'Khaki,Navy,White,Olive,Stone'),
(6, 'Denim Shorts', 'Our denim shorts are cut from premium denim with a relaxed fit and a raw hem. Features classic five-pocket styling and a button fly. A summer essential.', 39.99, 55, 'https://images.unsplash.com/photo-1560243563-062bfc001d68', '28,30,32,34,36', 'Light Wash,Dark Wash,Black'),
(6, 'Swim Shorts', 'Hit the beach in style with our swim shorts. Made from quick-dry recycled polyester with a mesh liner, elasticated waist and side pockets. Features our signature print.', 32.99, 60, 'https://images.unsplash.com/photo-1565361017291-e6f80a570eff', 'S,M,L,XL,XXL', 'Navy/White,Black,Blue Camo,Tropical Print'),
(7, 'Classic Crew Sweatshirt', 'A wardrobe cornerstone. Our classic crew sweatshirt is made from heavyweight cotton fleece with a brushed interior for softness. Features ribbed collar, cuffs and hem for a clean finish.', 42.99, 85, 'https://images.unsplash.com/photo-1434389677669-e08b4cac3105', 'XS,S,M,L,XL,XXL', 'Grey Marl,Black,Navy,Cream,Forest Green,Burgundy'),
(7, 'Graphic Sweatshirt', 'Express yourself with our graphic sweatshirt. Features bold screen-printed graphics on the front and back. Made from heavyweight fleece with a relaxed, boxy fit.', 48.99, 65, 'https://images.unsplash.com/photo-1503342394128-c104d54dba01', 'S,M,L,XL', 'Black,White,Grey'),
(7, 'Half-Zip Sweatshirt', 'A smart casual alternative to the full zip. Our half-zip sweatshirt features a stand collar, half-length zip and dropped shoulders. Made from premium cotton-polyester blend.', 52.99, 50, 'https://images.unsplash.com/photo-1605518216938-7c31b7b14ad0', 'S,M,L,XL,XXL', 'Navy,Black,Ecru,Olive,Burgundy'),
(7, 'Colour Block Sweatshirt', 'Stand out with our colour block sweatshirt. Features contrasting colour panels across the chest and sleeves for a bold, modern look. Made from soft fleece fabric.', 46.99, 45, 'https://images.unsplash.com/photo-1556821840-3a63f15732ce', 'S,M,L,XL', 'Black/Grey,Navy/Cream,Red/Black,Green/Black'),
(8, 'Classic Joggers', 'The ultimate comfort trouser. Our classic joggers are made from soft cotton fleece with an elasticated waistband, drawstring and tapered leg. Features side pockets and a back pocket.', 38.99, 90, 'https://images.unsplash.com/photo-1552902865-b72c031ac5ea', 'XS,S,M,L,XL,XXL', 'Black,Grey,Navy,Cream,Forest Green'),
(8, 'Tech Joggers', 'Performance meets style. Our tech joggers are made from a lightweight stretch fabric with moisture-wicking properties. Features multiple pockets including a zip pocket. Perfect for active days.', 54.99, 60, 'https://images.unsplash.com/photo-1542728928-1413d1894ed1', 'S,M,L,XL,XXL', 'Black,Charcoal,Navy,Olive'),
(8, 'Slim Fit Joggers', 'A more tailored take on the classic jogger. Our slim fit joggers feature a closer cut through the hip and thigh with a slight taper. Made from soft brushed cotton for all-day comfort.', 44.99, 70, 'https://images.unsplash.com/photo-1605774337664-7a846e9cdf17', 'XS,S,M,L,XL', 'Black,Grey Marl,Navy,Burgundy'),
(8, 'Cargo Joggers', 'The best of both worlds. Our cargo joggers combine the comfort of a jogger with the functionality of cargo trousers. Features multiple utility pockets on the leg and a relaxed fit.', 52.99, 50, 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80', 'S,M,L,XL,XXL', 'Olive,Black,Khaki,Navy'),
(9, 'Dad Hat', 'The relaxed, unstructured dad hat is a streetwear staple. Features a curved brim, adjustable strap and our embroidered logo on the front. Made from washed cotton for a vintage look.', 21.99, 110, 'https://images.unsplash.com/photo-1533055640609-24b498dfd74c', 'One Size', 'Black,White,Navy,Khaki,Pink,Sage Green'),
(9, 'Fitted Cap', 'A premium fitted cap for those who know their size. Features a structured crown, flat brim and our embroidered logo. Made from premium wool blend with a sweatband interior.', 28.99, 70, 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b', 'S,M,L,XL', 'Black,Navy,Grey,Red'),
(9, 'Trucker Cap', 'The iconic trucker cap with a modern twist. Features a mesh back panel for breathability, a structured front panel and an adjustable snapback closure. Perfect for summer days.', 23.99, 80, 'https://images.unsplash.com/photo-1521369909029-2afed882baee', 'One Size', 'Black/Black,Navy/White,Black/White,Olive/Khaki'),
(9, 'Wool Beanie', 'Premium warmth for cold days. Our wool beanie is knitted from soft merino wool blend for exceptional warmth without bulk. Features a folded cuff with our embroidered logo.', 26.99, 90, 'https://images.unsplash.com/photo-1576871337622-98d48d1cf531', 'One Size', 'Charcoal,Black,Cream,Navy,Forest Green,Burgundy'),
(10, 'Mini Shoulder Bag', 'Small but perfectly formed. Our mini shoulder bag fits your essentials with style. Features a zip top closure, adjustable chain strap and our logo embossed on the front. Made from faux leather.', 44.99, 45, 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa', 'One Size', 'Black,Brown,White,Tan'),
(10, 'Duffle Bag', 'Perfect for the gym, weekend trips or daily commuting. Our duffle bag features a main zip compartment, end pockets, shoe compartment and detachable shoulder strap. Made from durable canvas.', 74.99, 30, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62', 'One Size', 'Black,Navy,Olive,Grey'),
(10, 'Laptop Backpack', 'Designed for the modern professional. Features a padded 15-inch laptop compartment, USB charging port, anti-theft back pocket and ergonomic padded straps. Made from premium water-resistant nylon.', 89.99, 25, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62', 'One Size', 'Black,Grey,Navy');

-- Insert Admin User (placeholder hash)
INSERT INTO users (full_name, email, password, role) VALUES
('Admin User', 'admin@clothingbrand.com', '$2b$10$placeholder', 'admin');

-- Verify seed data
SELECT 'Total Products:' AS Info, COUNT(*) AS Count FROM products
UNION ALL
SELECT 'Total Categories:', COUNT(*) FROM categories
UNION ALL
SELECT 'Total Users:', COUNT(*) FROM users
UNION ALL
SELECT 'Total Orders:', COUNT(*) FROM orders;

SELECT
    c.name AS Category,
    COUNT(p.id) AS Total_Products,
    MIN(p.price) AS Lowest_Price,
    MAX(p.price) AS Highest_Price,
    ROUND(AVG(p.price), 2) AS Average_Price
FROM products p
JOIN categories c ON p.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
