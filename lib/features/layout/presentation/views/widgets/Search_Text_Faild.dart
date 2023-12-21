import 'package:flutter/material.dart';

class SearchFormAproduct extends StatelessWidget {
  const SearchFormAproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black)),
                filled: false,
                fillColor: const Color(0xffE9E9E9),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Search What You Want.....',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset('assets/images/Frame 106.png')
      ],
    );
    ;
  }
}
