import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/theme_cubit.dart';
import '/config/services/funcs/my_size.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final arentir = MySize.arentir;
late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    final top = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(children: [
        Container(
          height: top,
          color: Colors.transparent,
        ),
        buildTop(),
        buildContant(),
      ]),
    );
  }

  Widget buildTop() {
    return Container(
      color: Colors.orange,
      alignment: Alignment.center,
      height: arentir * 0.2,
      width: double.infinity,
      child: const Text(
        "EXEBITION",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget buildContant() {
    
    return BlocBuilder<ThemeCubit, ThemeState>(
         builder: (context, state) {
        return Column(
          children: [
              const Divider(color: Colors.orange),
                buildTitle("THEME"),
               const Divider(color: Colors.orange),
                buildDTBtn(
                  "System mode",
                  Icons.blur_off_sharp,
                  Icons.blur_on_sharp,
                  state.isSystem,
                  onTap: () => context.read<ThemeCubit>().tongleSystem,
                ),
                Opacity(
                  opacity: state.isSystem ? 0.5 : 1,
                  child: buildDTBtn(
                    state.isSystem ? "Closed" : "Light mode",
                    Icons.dark_mode,
                    Icons.wb_sunny_outlined,
                    state.isLight,
                    textP:state.isSystem ? "Closed" : "Dark mode",
                    onTap: () {
                      if (!state.isSystem) {
                        context.read<ThemeCubit>().tongleLight;
                      }
                    },
                  ),
                ),
               const Divider(color: Colors.orange),
          ],
        );
      }
    );
  }

  Widget buildDTBtn(
    String text,
    IconData iconP,
    IconData iconA,
    bool isOk, {
    String? textP,
    Function? onTap,
  }) {
return ListTile(
  onTap: (){
     if (onTap != null) onTap();
  },
  leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTitle(isOk ? text : textP ?? text, size: 16),
            ),
trailing: Icon(isOk ? iconA : iconP),
);
    // return InkWell(
    //   onTap: () {
    //     if (onTap != null) onTap();
    //   },
    //   child: Container(
    //     color: Colors.transparent,
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: buildTitle(isOk ? text : textP ?? text, size: 16),
    //         ),
    //         Icon(isOk ? iconA : iconP),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget buildTitle(String text, {double size = 18}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: size),
      ),
    );
  }

}
