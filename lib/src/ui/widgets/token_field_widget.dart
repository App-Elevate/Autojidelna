import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TokenFieldWidget extends StatefulWidget {
  const TokenFieldWidget({super.key});

  @override
  State<TokenFieldWidget> createState() => _TokenFieldWidgetState();
}

class _TokenFieldWidgetState extends State<TokenFieldWidget> {
  bool _isHidden = true;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: FirebaseAuth.instance.currentUser?.refreshToken,
      // ignore: discarded_futures
      future: FirebaseAuth.instance.currentUser?.getIdToken(),
      builder: (context, snapshot) {
        _textController.text = snapshot.data ?? '';
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                readOnly: true,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _isHidden = !_isHidden;
                    }),
                    icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelText: 'Firebase auth token',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  unawaited(Clipboard.setData(ClipboardData(text: 'Bearer ${_textController.text}')));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard!')),
                  );
                },
                child: const Text('Copy Bearer token'),
              ),
            ],
          ),
        );
      },
    );
  }
}
