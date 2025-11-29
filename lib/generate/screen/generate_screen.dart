import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/generate/manage/bloc/generate_bloc.dart';
import 'package:leelaah/generate/manage/state/generate_state.dart';
import 'package:leelaah/generate/manage/event/generate_event.dart';
import '../../utils/helper.dart';

class GenerateScreen extends StatelessWidget with Helper {
  List<String> optionsList = ['Image', 'Video', 'Audio'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      GenerateBloc()
        ..add(GetInitialData()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: BlocBuilder<GenerateBloc, GenerateState>(
            builder: (context, state) {
              final bloc = context.read<GenerateBloc>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 40,
                    ),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () => bloc.add(BackCall()),
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Generate New Post",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      // hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      labelText: "Transaction Type",
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                    ),
                    value: selectedType,
                    hint: Text("Transaction Type"),
                    items: optionsList
                        .map(
                          (e) =>
                          DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                    )
                        .toList(),
                    onChanged: (v) {
                      selectedType = v ?? "";
                      // bloc.add(CategoryChangeCall(v));
                    },
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
