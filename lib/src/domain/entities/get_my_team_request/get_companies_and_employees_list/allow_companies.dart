class AllowedCompanies {
  int companyId;
  int parentId;
  String companyName;
  List<AllowedCompanies>? children;
  bool isSelected;

  AllowedCompanies({
    required this.companyId,
    required this.parentId,
    required this.companyName,
    this.children,
    this.isSelected = false,
  }) {
    children ??= [];
  }

  void addChild(AllowedCompanies child) {
    children?.add(child);
  }

  AllowedCompanies copy() {
    List<AllowedCompanies>? copiedChildren;
    if (children != null) {
      copiedChildren = [];
      for (var child in children!) {
        copiedChildren.add(child.copy());
      }
    }

    return AllowedCompanies(
      companyId: companyId,
      parentId: parentId,
      companyName: companyName,
      children: copiedChildren,
      isSelected: isSelected,
    );
  }
}
