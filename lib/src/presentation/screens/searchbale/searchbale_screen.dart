import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/search_text_field_widget.dart';

class SearchableScreen extends BaseStatefulWidget {
  final SearchableModel searchableItemModel;

  const SearchableScreen({
    required this.searchableItemModel,
    Key? key,
  }) : super(key: key);

  @override
  BaseState<SearchableScreen> baseCreateState() {
    return _SearchableScreenState();
  }
}

class _SearchableScreenState extends BaseState<SearchableScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchableItem> checkBoxModelList = [];
  List<SearchableItem> checkBoxModelFilterList = [];

  @override
  void initState() {
    super.initState();
    checkBoxModelList = widget.searchableItemModel.searchableItems;
    checkBoxModelFilterList = checkBoxModelList;
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: widget.searchableItemModel.title,
        isHaveBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchTextFieldWidget(
                controller: _searchController,
                labelText: S.of(context).search,
                clearButtonAction: () {
                  _searchController.clear();
                  setState(() {
                    checkBoxModelFilterList = checkBoxModelList;
                  });
                },
                onChange: _filterSearch,
                onSubmitted: (value) {}),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: checkBoxModelFilterList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: InkWell(
                      onTap: () =>
                          _onTapItem(checkBoxModelFilterList[index].id),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            checkBoxModelFilterList[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: ColorSchemes.black,
                                    fontWeight: Constants.fontWeightRegular),
                          ),
                          CustomRadioButtonWidget(
                              isSelected:
                                  checkBoxModelFilterList[index].isChecked),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterSearch(String query) {
    setState(() {
      checkBoxModelFilterList = checkBoxModelList
          .where(
            (item) =>
                item.title.toLowerCase().contains(query.trim().toLowerCase()),
          )
          .toList();
    });
  }

  void _onTapItem(int id) {
    setState(() {});
    for (var element in widget.searchableItemModel.searchableItems) {
      if (element.id == id) {
        element.isChecked = true;
      } else {
        element.isChecked = false;
      }
    }
    Navigator.pop(context, widget.searchableItemModel.searchableItems);
  }
}
