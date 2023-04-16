import 'package:answer24/models/app_user.dart';
import 'package:answer24/utilities/app_image.dart';
import 'package:answer24/utilities/utilities.dart';
import 'package:answer24/widgets/call/call_option_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppUser user = AppUser();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 72,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.1),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.profileURL),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Calling...'),
              ),
              SizedBox(
                height: 24,
                child: FittedBox(
                  child: Text(
                    user.firstName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.videocam_fill,
                    isSelected: false,
                    onTap: () {},
                  ),
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.add,
                    isSelected: false,
                    onTap: () {},
                  ),
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.pencil_ellipsis_rectangle,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.mic_slash,
                    isSelected: false,
                    onTap: () {},
                  ),
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.pause_circle,
                    isSelected: false,
                    onTap: () {},
                  ),
                  CallOptionButtonWidget(
                    icon: CupertinoIcons.recordingtape,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.volume_up,
                  size: 32,
                  color: Utilities.solidGreyColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red[600],
                  child: const Icon(
                    CupertinoIcons.phone_down_fill,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.dialpad,
                  size: 32,
                  color: Utilities.solidGreyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
