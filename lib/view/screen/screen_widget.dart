import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/assigment_bloc.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';

class MyView extends StatelessWidget {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<AssigmentBloc>();
    Widget buildResultWigdet(Status status, AssigmentStateInitial state) {
      Widget result = const SizedBox();
      var cekStatus = state.status;
      if (cekStatus == Status.idle) {
        result = const Text('......');
      } else if (cekStatus == Status.loading) {
        result = const Center(
          child: CircularProgressIndicator(),
        );
      } else if (cekStatus == Status.succes) {
        result = Wrap(
          children: state.result
              .map((e) => Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(e.toString()),
                  ))
              .toList(),
        );
      }
      return SizedBox(
        width: double.infinity,
        child: result,
      );
    }

    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 174, 202, 250),
        appBar: AppBar(
          title: const Text(
            'Final Assigment',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<AssigmentBloc, AssigmentState>(
          builder: (context, state) {
            if (state is AssigmentStateInitial) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ahmad Lutfi Farizi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AssigmentTextField(state: state),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Button(
                                    number: '1 ',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        bloc.add(
                                          AssigmentEvent.onGetResult1(
                                            int.parse(
                                                state.textController.text),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Button(
                                    number: '2 ',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        bloc.add(
                                          AssigmentEvent.onGetResult2(
                                            int.parse(
                                                state.textController.text),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Button(
                                    number: '3 ',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        bloc.add(
                                          AssigmentEvent.onGetResult3(
                                            int.parse(
                                                state.textController.text),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Button(
                                    number: '4 ',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        bloc.add(
                                          AssigmentEvent.onGetResult4(int.parse(
                                              state.textController.text)),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      'hasil :',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child:
                                        buildResultWigdet(state.status, state),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
