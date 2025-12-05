import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leelaah/generate/manage/event/generate_event.dart';
import '../../../utils/helper.dart';
import '../../generate_repository.dart';
import '../state/generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> with Helper {
  GenerateBloc() : super(GenerateState.initial()) {
    on<ChangeModelSelected>((event, emit) async {
      emit(
        state.copyWith(model: event.model ?? "Flux Schnell (Fast - 15-20s)"),
      );
    });

    on<ChangeTypeSelected>((event, emit) async {
      emit(state.copyWith(type: event.type ?? "Image"));
    });
    on<onPromptChange>((event, emit) async {
      emit(state.copyWith(prompt: event.prompt ?? ""));
    });
    on<ChangeRatioSelected>((event, emit) async {
      emit(state.copyWith(ratio: event.ratio ?? "1:1"));
    });
    on<BackCall>((event, emit) async {
      callBackScreen();
    });
    on<GenerateClick>((event, emit) async {
      Map<String, dynamic> body = {
        "prompt": state.prompt,
        "selectedModel": state.model == "Flux Schnell (Fast - 15-20s)"
            ? "flux-schnell"
            : "flux-1-srpo",
        "aspectRatio": state.ratio,
        "numInferenceSteps": 28,
        "guidanceScale": 4.5,
        "style": "digital-art",
        "numImages": 1,
      };

      emit(state.copyWith(errorMessage: "", isLoading: false));
      Map<String, dynamic> apiResponse = await GenerateRepository()
          .generateImageApi(body);

      if (apiResponse['msg'].toString().isEmpty) {
        // InvoiceListingApiModel response = InvoiceListingApiModel.fromJson(
        //   apiResponse['response'],
        // );
        emit(state.copyWith(errorMessage: "", isLoading: false));
      } else {
        emit(
          state.copyWith(errorMessage: apiResponse['msg'], isLoading: false),
        );
      }
    });
    on<GetInitialData>((event, emit) async {
      // emit(state.copyWith(userFor: event.userFor));
      // emit(state.copyWith(isLoading: true));
      emit(state.copyWith(errorMessage: "", isLoading: false));

      // Map<String, dynamic> apiResponse =
      //     await GenerateRepository().invoiceListApi();
      //
      // if (apiResponse['msg'].toString().isEmpty) {
      //   InvoiceListingApiModel response = InvoiceListingApiModel.fromJson(
      //     apiResponse['response'],
      //   );
      //   emit(state.copyWith(errorMessage: "", isLoading: false));
      // } else {
      //   emit(
      //     state.copyWith(
      //       invoiceList: [],
      //       errorMessage: apiResponse['msg'],
      //       isLoading: false,
      //     ),
      //   );
      // }
    });
  }
}
