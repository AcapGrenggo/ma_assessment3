import 'package:flutter/material.dart';

class PizzaMenuPage extends StatefulWidget {
  const PizzaMenuPage({super.key});

  @override
  State<PizzaMenuPage> createState() => _PizzaMenuPageState();
}

class _PizzaMenuPageState extends State<PizzaMenuPage> {
  final List<Map<String, String>> pizzas = const [
    {
      'name': 'Margherita',
      'price': 'RM20.00',
      'description':'Classic tomato and mozzarella pizza',
      'image': 'https://static.vecteezy.com/system/resources/previews/026/850/474/non_2x/margherita-pizza-transparent-png.png'
    },
    {
      'name': 'Pepperoni',
      'price': 'RM23.00',
      'description':'Pizza topped with pepperoni slices',
      'image': 'https://static.vecteezy.com/system/resources/previews/036/497/986/non_2x/ai-generated-delicious-pepperoni-pizza-on-transparent-background-free-png.png'
    },
    {
      'name': 'Veggie Delight',
      'price': 'RM18.90',
      'description':'Pizza with a variety of vegetables',
      'image': 'https://pngfre.com/wp-content/uploads/pizza-png-from-pngfre-3.png'
    },
    {
      'name': 'BBQ Chicken',
      'price': 'RM19.00',
      'description':'Pizza with BBQ chicken',
      'image': 'https://static.vecteezy.com/system/resources/previews/036/497/987/non_2x/ai-generated-savoring-the-flavorful-layers-of-bbq-chicken-pizza-on-transparent-background-free-png.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pizza Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFA50805),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const Text('🍕Explore Our Tasty Selection - Pick Your Perfect Slice!🔥'),
              const SizedBox(height: 10,),
              Expanded(
                  child: ListView.builder(
                      itemCount: pizzas.length,
                      itemBuilder: (context, index){
                        final pizza = pizzas[index];

                        return Card(
                          color: const Color(0xFFCF6666),
                          child: ListTile(
                            leading: Image.network(
                              pizza['image']!,
                              fit: BoxFit.cover,
                            ),
                            title: Text('${pizza['name']} Pizza'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pizza['description']!),
                                const SizedBox(height: 5,),
                                Text(pizza['price']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                              ],
                            ),
                            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right)),
                          ),
                        );
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}