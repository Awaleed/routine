import 'package:flutter/material.dart';

class ColorPickerFormField extends FormField<Color> {
  ColorPickerFormField({
    Key key,
    @required this.color,
    @required this.valueChanged,
    this.decoration,
    FormFieldValidator<Color> validator,
    bool autovalidate,
    List<Color> availableColors,
  })  : availableColors = availableColors ??= Colors.primaries,
        super(
            key: key,
            validator: validator,
            autovalidate: autovalidate,
            builder: (FormFieldState<Color> field) {
              // ignore: invalid_use_of_protected_member
              field.setValue(color);
              final InputDecoration efDecoration = (decoration ?? const InputDecoration()).applyDefaults(Theme.of(field.context).inputDecorationTheme);
              return InputDecorator(
                decoration: efDecoration.copyWith(errorText: field.errorText),
                child: ColorPicker(
                  color: color,
                  valueChanged: (Color value) {
                    // ignore: invalid_use_of_protected_member
                    field.setValue(value);
                    valueChanged(value);
                  },
                  availableColors: availableColors,
                ),
              );
            });

  final Color color;
  final ValueChanged<Color> valueChanged;
  final List<Color> availableColors;
  final InputDecoration decoration;
}

class ColorPicker extends StatelessWidget {
  ColorPicker({
    Key key,
    @required this.color,
    @required this.valueChanged,
    List<Color> availableColors,
  })  : availableColors = availableColors ??= Colors.primaries,
        super(key: key);

  final Color color;
  final ValueChanged<Color> valueChanged;
  final List<Color> availableColors;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 5,
      runSpacing: 5,
      children: List<Widget>.generate(
        availableColors.length,
        (int index) {
          final Color mColor = availableColors[index];
          if (color.value == mColor.value) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(backgroundColor: mColor),
                Icon(Icons.check_circle_outline),
              ],
            );
          }
          return GestureDetector(
            onTap: () => valueChanged(mColor),
            child: CircleAvatar(backgroundColor: mColor),
          );
        },
      ),
    );
  }
}
