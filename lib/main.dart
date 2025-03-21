import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
      author: 'Oscar Wilde',
      text: 'Be yourself; everyone else is already taken',
    ),
    Quote(
      author: 'Oscar Wilde',
      text: 'I have nothing to declare except my genius',
    ),
    Quote(
      author: 'Oscar Wilde',
      text: 'The truth is rarely pure and never simple',
    ),
  ];

  void _addNewQuote(String text, String author) {
    setState(() {
      quotes.add(Quote(author: author, text: text));
    });
  }

  void _editQuote(Quote oldQuote) {
    TextEditingController textController = TextEditingController(
      text: oldQuote.text,
    );
    TextEditingController authorController = TextEditingController(
      text: oldQuote.author,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Quote"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Quote'),
              ),
              TextField(
                controller: authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty &&
                    authorController.text.isNotEmpty) {
                  setState(() {
                    oldQuote.text = textController.text;
                    oldQuote.author = authorController.text;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showAddQuoteDialog() {
    TextEditingController textController = TextEditingController();
    TextEditingController authorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Quote"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Quote'),
              ),
              TextField(
                controller: authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty &&
                    authorController.text.isNotEmpty) {
                  _addNewQuote(textController.text, authorController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children:
            quotes
                .map(
                  (quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    },
                    edit: () => _editQuote(quote),
                  ),
                )
                .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddQuoteDialog,
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
