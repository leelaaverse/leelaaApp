import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/constants/app_colors.dart';
import 'package:leelaah/generate/manage/bloc/generate_bloc.dart';
import 'package:leelaah/generate/manage/state/generate_state.dart';
import 'package:leelaah/generate/manage/event/generate_event.dart';
import 'package:leelaah/widget/custom_btn.dart';
import 'package:leelaah/widget/text_field.dart';
import '../../utils/helper.dart';

class GenerateScreen extends StatelessWidget with Helper {
  List<String> optionsList = ['Image', 'Video', 'Audio'];
  List<String> modelList = [
    'Flux Schnell (Fast - 15-20s)',
    'Flux.1 SRPO (Quality - 25-35s)',
  ];
  List<String> ratioList = ['1:1', '16:9', '9:16', '4:3', '3:4'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GenerateBloc()..add(GetInitialData()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.black,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Generate New Post",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          decoration: InputDecoration(
                            // hintText: hintText,
                            hintStyle: TextStyle(color: Colors.white70),
                            labelText: "Type",
                            labelStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
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
                          value: state.type,
                          hint: Text("Type"),

                          items: optionsList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => bloc.add(ChangeTypeSelected(v)),
                        ),
                        SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          decoration: InputDecoration(
                            // hintText: hintText,
                            hintStyle: TextStyle(color: Colors.white70),
                            labelText: "Model",
                            labelStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
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
                          value: state.model,
                          hint: Text("Model"),

                          items: modelList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => bloc.add(ChangeModelSelected(v)),
                        ),
                        SizedBox(height: 25),
                        DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          decoration: InputDecoration(
                            // hintText: hintText,
                            hintStyle: TextStyle(color: Colors.white70),
                            labelText: "Aspect Ratio",
                            labelStyle: TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
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
                          value: state.ratio,
                          hint: Text("Aspect Ratio"),

                          items: ratioList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => bloc.add(ChangeRatioSelected(v)),
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          hintText: "Prompt",
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          onChanged: (v) => bloc.add(onPromptChange(v)),
                        ),

                        SizedBox(height: 60),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButton(
                            label: "Generate",
                            btnWidth: double.infinity,
                            paddingVertical: 14,
                            onPressed: () => bloc.add(GenerateClick()),
                          ),
                        ),
                      ],
                    ),
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
