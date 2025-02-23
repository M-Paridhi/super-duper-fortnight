import 'package:flutter/material.dart';

// User model
class User {
  final String email;
  final String username;
  final String password;
  final String contact;
  

  User({
    required this.email,
    required this.username,
    required this.password,
    required this.contact,
    
  });
}

// Item model for marketplace
class Item {
  final String category;
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  final String sellerContact; // New field to hold the contact details

  Item({
    required this.category,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.sellerContact,
  });
}

// Global variables to store signed-up user and added items
User? currentUser;
final ValueNotifier<List<Item>> marketplaceItemsNotifier = ValueNotifier([]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IIT-Mandi Marketplace',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 71, 166, 238),
              Color.fromARGB(255, 186, 216, 236)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'IIT-Mandi Marketplace',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 3, 74, 132),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Signup Screen
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color.fromARGB(255, 239, 5, 83),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 123, 161),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!value.contains('iitmandi.ac.in')) {
                    return 'Email must contain "iitmandi.ac.in"';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact number cannot be empty';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit contact number';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Create a new user and store globally
                    currentUser = User(
                      email: _emailController.text,
                      username: _usernameController.text,
                      password: _passwordController.text,
                      contact: _contactController.text,
                     
                    );
                    // Navigate to the MainScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen ()),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  // Using a dynamic list of screens so that the UI can update as items change.
  List<Widget> get _widgetOptions => <Widget>[
        const MarketplaceScreen(),
        const AddItemScreen(),
        ProfileScreen(user: currentUser),
      ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Item'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Marketplace Screen (shows list of items in real time)
class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IIT Marketplace'),
        backgroundColor: const Color.fromARGB(255, 119, 185, 239),
      ),
      backgroundColor: const Color.fromARGB(255, 134, 217, 228),
      body: ValueListenableBuilder<List<Item>>(
        valueListenable: marketplaceItemsNotifier,
        builder: (context, items, child) {
          if (items.isEmpty) {
            return const Center(child: Text('No items available.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.network(
                    item.imageUrl,
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  ),
                  title: Text(item.name),
                  subtitle: Text(
                    '${item.category}\n${item.price}\nContact to purchase: ${item.sellerContact}',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Add Item Screen
class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});
  
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _categoryController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  
  void _submitItem() {
    if (_formKey.currentState?.validate() ?? false) {
      // Create an item from the input details.
      final newItem = Item(
        category: _categoryController.text,
        name: _nameController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        price: _priceController.text,
        sellerContact: currentUser != null ? currentUser!.contact : 'N/A',
      );
      // Add the item to the notifier list.
      marketplaceItemsNotifier.value = [
        ...marketplaceItemsNotifier.value,
        newItem
      ];
      // Optionally, clear the form.
      _categoryController.clear();
      _nameController.clear();
      _descriptionController.clear();
      _imageUrlController.clear();
      _priceController.clear();
      // Show a confirmation message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item added successfully!')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter a category' : null,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name of Item'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter a description' : null,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter an image URL' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter a price' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitItem,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  final User? user;
  
  const ProfileScreen({super.key, required this.user});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? const Center(child: Text("No user data available."))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${user!.username}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Email ID: ${user!.email}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Contact Number: ${user!.contact}', style: const TextStyle(fontSize: 16)),
                  
                ],
              ),
      ),
    );
  }
}