import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/search/manager/search_bloc.dart';
import 'package:store_app/features/search/manager/search_state.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/search/widgets/search_result_item.dart';
import 'package:store_app/features/search/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(_onSearchChanged);
    super.initState();
  }

  void _onSearchChanged() {
    final text = searchController.text;
    if (text.isNotEmpty) {
      context.read<SearchBloc>().add(
        SearchRequest(title: searchController.text.trim()),
      );
    } else {
      context.read<SearchBloc>().add(SearchClear());
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Search",
        actions: [
          StoreIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 72.h),
          child: SearchTextField(searchController: searchController),
        ),
      ),
      extendBody: true,
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            color: AppColors.blackMain,
            onRefresh:
                () async => context.read<SearchBloc>().add(
                  SearchRequest(title: searchController.text),
                ),
            child:
                state.products.isEmpty
                    ? StoreNullBody(
                      image: "assets/icons/no_result.svg",
                      title: "No Results Found!",
                      subTitle: "Try a similar word or something more general.",
                    )
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder:
                                  (context, index) => SearchResultItem(
                                    product: state.products[index],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(select: 2),
    );
  }
}
