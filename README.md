Sales(
saleName: "Categories",
buttonTextName: 'See All',
onTap: () {},
),
SizedBox(height: 20),
Container(
height: 120,
child: Row(
children: [
Expanded(
child: ListView.builder(
shrinkWrap: true,
scrollDirection: Axis.horizontal,
itemCount:
categoriesProvider.productCategories?.length ??
0,
itemBuilder: (context, index) {
ProductCategory? productCategory =
categoriesProvider.productCategories?[index];
if (productCategory != null) {
print(productCategory.toString());
return ListgroupItemWidget(
imagePath: productCategory.thumbnailImage ??
"https://picsum.photos/200",
categoryName: productCategory.name,
onTap: () {
// Handle category item click
},
);
} else {
return Container();
}
},
),
),
],
),
),