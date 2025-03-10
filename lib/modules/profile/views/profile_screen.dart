import 'package:flutter/material.dart';
import 'package:noortify/modules/profile/widgets/custom_container.dart';
import 'package:noortify/modules/profile/widgets/forward_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 52, left: 36, right: 36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/image.png"),
              ),
              const SizedBox(height: 16),
              Text(
                "Andrey Thomson",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.39,
                    ),
              ),
              Text(
                "audrey@nootify.com",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                ),
                onPressed: () {},
                child: const Text("Edit Profile"),
              ),
              const SizedBox(height: 36),
              CustomContainer(
                items: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "My Account",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: ForwardIconButton(onPressed: () {}),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white,
                    height: 8,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(
                      Icons.support,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Support",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: ForwardIconButton(onPressed: () {}),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomContainer(
                items: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Push Notifications",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: Switch(
                      activeTrackColor: Color.fromARGB(255, 0, 150, 10),
                      value: switchValue,
                      onChanged: (newValue) {
                        switchValue = newValue;
                        debugPrint("Switch value: $switchValue");
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white,
                    height: 8,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        leading: const Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 199, 45, 45),
                        ),
                        title: Text(
                          "Logout",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Color.fromARGB(255, 199, 45, 45),
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
