import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  final Function edit;

  QuoteCard({required this.quote, required this.delete, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[900]),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => delete(),
                  label: Text('Delete', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.delete, color: Colors.white),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[700]),
                ),
                ElevatedButton.icon(
                  onPressed: () => edit(), // Call edit function
                  label: Text('Edit', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.edit, color: Colors.white),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
