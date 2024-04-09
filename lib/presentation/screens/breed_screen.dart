import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:cat_breeds_app/presentation/widgets/shared/custom_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedScreen extends StatefulWidget {
  static const String name = 'breed_screen';
  final String breedId;
  const BreedScreen({super.key, required this.breedId});

  @override
  BreedScreenState createState() => BreedScreenState();
}

class BreedScreenState extends State<BreedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatBreedsBloc>().add(GetBreedByIdEvent(widget.breedId));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return BlocBuilder<CatBreedsBloc, CatBreedsState>(
      builder: (context, state) {
        if (state.isLoading || state.selectedCatBreed == null) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          ));
        }
        final temp = state.selectedCatBreed!.temperament.split(',');
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              state.selectedCatBreed!.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.35,
                  child: Image.network(
                    'https://cdn2.thecatapi.com/images/${state.selectedCatBreed!.referenceImageId}.jpg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/image_not_available.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedCatBreed!.name,
                          style: textStyle.headlineLarge,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Origin:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.0),
                            ),
                            Text(state.selectedCatBreed!.origin,
                                style: textStyle.bodyLarge),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(state.selectedCatBreed!.description,
                            style: textStyle.bodyLarge),
                        const SizedBox(height: 10),
                        Text(
                          'Life Span: ${state.selectedCatBreed!.lifeSpan} years',
                          style: textStyle.bodyLarge,
                        ),
                        const Divider(
                          color: Colors.black54,
                          thickness: 1.0,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                ...temp.map((temp) => Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      label: Text(temp,
                                          style: textStyle.bodyLarge),
                                    ))),
                              ],
                            )),
                        const Divider(
                          color: Colors.black54,
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 10),
                        CustomDetailView(
                          breed: state.selectedCatBreed!,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
