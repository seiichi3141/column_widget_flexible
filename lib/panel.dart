import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  const Panel({
    @required this.initialMainAxisAlignment,
    @required this.initialMainAxisSize,
    @required this.initialCrossAxisAlignment,
    @required this.onMainAxisAlignmentChanged,
    @required this.onMainAxisSizeChanged,
    @required this.onCrossAxisAlignmentChanged,
  });

  final MainAxisAlignment initialMainAxisAlignment;
  final MainAxisSize initialMainAxisSize;
  final CrossAxisAlignment initialCrossAxisAlignment;

  final ValueChanged<int> onMainAxisAlignmentChanged;
  final ValueChanged<int> onMainAxisSizeChanged;
  final ValueChanged<int> onCrossAxisAlignmentChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Selection(
            title: 'MainAxisAlignment',
            items: MainAxisAlignment.values,
            initial: initialMainAxisAlignment,
            onSelectChanged: onMainAxisAlignmentChanged,
          ),
          const Divider(height: 2),
          Selection(
            title: 'MainAxisSize',
            items: MainAxisSize.values,
            initial: initialMainAxisSize,
            onSelectChanged: onMainAxisSizeChanged,
          ),
          const Divider(height: 2),
          Selection(
            title: 'CrossAxisAlignment',
            items: CrossAxisAlignment.values,
            initial: initialCrossAxisAlignment,
            onSelectChanged: onCrossAxisAlignmentChanged,
          ),
        ],
      ),
    );
  }
}

class Selection extends StatefulWidget {
  const Selection({
    @required this.title,
    @required this.items,
    @required this.initial,
    @required this.onSelectChanged,
  })  : assert(title != null),
        assert(items != null),
        assert(initial != null),
        assert(onSelectChanged != null);

  final String title;
  final List<dynamic> items;
  final dynamic initial;
  final ValueChanged<int> onSelectChanged;

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  int _page = 0;
  PageController _controller;
  List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _page = (widget.initial as dynamic).index as int;
    _controller = PageController(initialPage: _page);

    _children = widget.items.map((dynamic item) {
      final text =
          item.toString().replaceFirst('${item.toString().split('.')[0]}.', '');
      return Center(
        child: Text(text),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(child: Text(widget.title)),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_left),
          onPressed: 0 < _page ? () => _onPressedArrow(-1) : null,
        ),
        SizedBox(
          width: 100,
          height: 20,
          child: PageView(
            controller: _controller,
            children: _children,
            onPageChanged: (page) {
              setState(() {
                _page = page;
              });
              widget.onSelectChanged(_page);
            },
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_right),
          onPressed:
              _page < widget.items.length - 1 ? () => _onPressedArrow(1) : null,
        ),
      ],
    );
  }

  void _onPressedArrow(int add) {
    setState(() {
      _page += add;
      _controller.animateToPage(
        _page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }
}
