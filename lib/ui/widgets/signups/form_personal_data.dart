import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kawal_desa2/constants/const.dart';
import 'package:kawal_desa2/ui/shared/shared_style.dart';
import 'package:kawal_desa2/ui/shared/ui_helper.dart';
import 'package:kawal_desa2/ui/widgets/text_field_on_changed_widget.dart';
import 'package:kawal_desa2/ui/widgets/text_field_widget.dart';
import 'package:kawal_desa2/viewmodels/sign_up_view_model.dart';
import 'package:loading_overlay/loading_overlay.dart';

class FormPersonalData extends StatefulWidget {
  SignUpViewModel model;
  @override
  _FormPersonalDataState createState() => _FormPersonalDataState();
  FormPersonalData({this.model});
}

class _FormPersonalDataState extends State<FormPersonalData> {
  SignUpViewModel model;
  String valueDrop;
  @override
  void initState(){
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: model.busy,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    verticalSpaceSmall,
                    TextFieldWidget(
                        hintText: 'Name',
                        icon: Icons.person,
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                    hintText: 'Profesi / Jabatan / Status',
                    icon: Icons.panorama_fish_eye,
                    keyboardType: TextInputType.text,
                    isPassword: false,
                    textFieldController: null,
                    colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                        hintText: 'E-Mail',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                        hintText: 'No KTP / NISN / NIP',
                        icon: Icons.format_list_numbered,
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                        hintText: 'Password',
                        icon: Icons.lock,
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldWidget(
                        hintText: 'No Handphone',
                        icon: Icons.person,
                        keyboardType: TextInputType.phone,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main
                    ),
                    verticalSpaceSmall,
                    TextFieldOnChangeWidget(
                        hintText: 'Registration Code',
                        icon: Icons.code,
                        onChanged: (value){
                          model.units.clear();
                          if(value != null && value.toString().isNotEmpty){
                            // model.company = value;
                            model.getCompanyUnit((value));
                          }
                        },
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        colorIcon: color_main
                    ),
                    Visibility(
                        child: verticalSpaceSmall,
                        visible: model.changeVisibility(),
                    ),
                    Visibility(
                      visible: model.changeVisibility(),
                      child: Container(
                        padding: fieldPadding,
                        width: screenWidthPercent(context, multipleBy: 0.9),
                        height: fieldHeight,
                        child: DropdownButton(
                          isExpanded: true,
                          hint:Text("Choose unit"),
                          value: valueDrop,
                          items: model.units == null
                              ? null
                              : model.units.map((value) {
                                return DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                );
                          },
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              valueDrop = value;
                              model.onUnitChangeSelect(value);
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ));
  }
}
