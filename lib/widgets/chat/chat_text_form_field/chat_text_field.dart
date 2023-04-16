// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../enums/chat/message_type_enum.dart';
import '../../../models/chat/chat.dart';
import '../../custom/asset_video_player.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    required this.chat,
    required this.onStartRecoding,
    Key? key,
  }) : super(key: key);
  final Chat chat;
  final VoidCallback onStartRecoding;
  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _text = TextEditingController();
  List<File> files = <File>[];
  static const double borderRadius = 12;
  bool isLoading = false;
  MessageTypeEnum types = MessageTypeEnum.text;

  void _onListen() => setState(() {});

  @override
  void initState() {
    _text.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    _text.dispose();
    _text.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (files.isNotEmpty)
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: files.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 80,
                          width: 80,
                          child: types == MessageTypeEnum.image
                              ? Image.file(files[index], fit: BoxFit.cover)
                              : AssetVideoPlayer(path: files[index].path),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 80,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        files.clear();
                      });
                    },
                    splashRadius: 16,
                    icon: const Icon(Icons.cancel),
                  ),
                )
              ],
            ),
          ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                splashRadius: 2,
                icon: const Icon(CupertinoIcons.camera),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 2,
                icon: const Icon(Icons.attach_file_sharp),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _text,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        minLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Text Message ...',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: _text.text.isNotEmpty
                          ? IconButton(
                              onPressed: () async {
                                if ((_text.text.trim().isEmpty &&
                                        files.isEmpty) ||
                                    isLoading) {
                                  return;
                                }
                                setState(() {
                                  isLoading = true;
                                });

                                setState(() {
                                  files = <File>[];
                                  isLoading = false;
                                });
                              },
                              splashRadius: 16,
                              icon: Icon(
                                Icons.send,
                                color: isLoading
                                    ? Colors.grey
                                    : Theme.of(context).iconTheme.color,
                              ),
                            )
                          : IconButton(
                              onPressed: widget.onStartRecoding,
                              splashRadius: 1,
                              icon: const Icon(
                                Icons.mic_none,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class _TextHintButton extends StatelessWidget {
  const _TextHintButton({required this.hint, required this.chat, Key? key})
      : super(key: key);
  final String hint;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          hint,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
