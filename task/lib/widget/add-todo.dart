import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController title;
  final TextEditingController description;
  bool isFavorite;
  final void Function(bool isFavorite) onchangeFavorite;
  final void Function() saveto;

  AddTodo({
    super.key,
    required this.formKey,
    required this.title,
    required this.description,
    required this.saveto,
    required this.isFavorite,
    required this.onchangeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    bool _dscriptionYn = true;

    return FloatingActionButton(
      onPressed: () {
        _dscriptionYn = true;
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: title,
                          autofocus: true,
                          decoration: InputDecoration(hintText: "새 할 일"),
                          onFieldSubmitted: (value) {
                            final form = formKey.currentState;

                            if (form == null || !form.validate()) {
                              Navigator.pop(context);
                              return;
                            }

                            saveto();
                            Navigator.pop(context);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "제목은 입력하셔야 합니다.";
                            }
                          },
                        ),
                        Visibility(
                          visible: !_dscriptionYn,
                          child: TextFormField(
                            controller: description,
                            minLines: 4,
                            maxLines: 10,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _dscriptionYn = !_dscriptionYn;
                                });
                              },
                              child: _dscriptionYn
                                  ? Icon(Icons.short_text_rounded, size: 24)
                                  : Icon(Icons.title),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                onchangeFavorite(!isFavorite);
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: isFavorite
                                  ? Icon(Icons.star, size: 24)
                                  : Icon(Icons.star_border, size: 24),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                final form = formKey.currentState;

                                if (form == null || !form.validate()) {
                                  return;
                                }

                                saveto();
                                Navigator.pop(context);
                              },
                              child: Text("저장"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
      backgroundColor: const Color.fromARGB(255, 255, 42, 0),
      child: const Icon(Icons.add, color: Colors.white, size: 24),
    );
  }
}

Widget addTodo(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController tilte,
  TextEditingController description,
  bool isFavorite,
  Function(bool isFavorite) saveto,
) {
  bool _dscriptionYn = true;

  return FloatingActionButton(
    onPressed: () {
      _dscriptionYn = true;
      showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,

        builder: (context) {
          bool isFavorite = false;
          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20,
                  top: 12,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: tilte,
                        autofocus: true,
                        decoration: InputDecoration(hintText: "새 할 일"),
                        onFieldSubmitted: (value) {
                          final form = formKey.currentState;

                          if (form == null || !form.validate()) {
                            Navigator.pop(context);
                            return;
                          }

                          saveto(isFavorite);
                          Navigator.pop(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "제목은 입력하셔야 합니다.";
                          }
                        },
                      ),
                      Visibility(
                        visible: !_dscriptionYn,
                        child: TextFormField(
                          controller: description,
                          minLines: 4,
                          maxLines: 10,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _dscriptionYn = !_dscriptionYn;
                              });
                            },
                            child: _dscriptionYn
                                ? Icon(Icons.short_text_rounded, size: 24)
                                : Icon(Icons.title),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: isFavorite
                                ? Icon(Icons.star, size: 24)
                                : Icon(Icons.star_border, size: 24),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              final form = formKey.currentState;

                              if (form == null || !form.validate()) {
                                return;
                              }

                              saveto(isFavorite);
                              Navigator.pop(context);
                            },
                            child: Text("저장"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
    backgroundColor: const Color.fromARGB(255, 255, 42, 0),
    child: const Icon(Icons.add, color: Colors.white, size: 24),
  );
}
