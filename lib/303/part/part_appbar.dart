part of './part_of_learn.dart';


class _partofAppBar extends StatelessWidget with PreferredSizeWidget {
  const _partofAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("aaa"),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
