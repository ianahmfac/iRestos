import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../store/detail/detail_store.dart';
import '../widgets/review_item.dart';
import '../widgets/state_info.dart';
import '../widgets/title_section.dart';
import 'add_review_form.dart';

class ReviewPage extends StatelessWidget {
  static const routeName = '/review-page';

  final Restaurant restaurant;
  const ReviewPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  void _showForm(BuildContext context, DetailStore detailStore) async {
    final completed = await Navigator.pushNamed(
      context,
      AddReviewForm.routeName,
      arguments: restaurant,
    );
    if (completed == true) {
      detailStore.fetchDetailRestaurant(restaurant.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailStore = getIt<DetailStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.name}'),
      ),
      body: _contentBody(detailStore),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context, detailStore),
        label: Text('Write Review'),
        icon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
      ),
    );
  }

  Widget _contentBody(DetailStore detailStore) {
    return Observer(
      builder: (_) {
        switch (detailStore.networkState) {
          case NetworkState.Initialize:
            return Center(child: CupertinoActivityIndicator());
          case NetworkState.Loaded:
            final detailRestaurant = detailStore.restaurantDetail;
            if (detailRestaurant!.customerReviews.isNotEmpty)
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSection(
                    title:
                        'Total: ${detailRestaurant.customerReviews.length} review(s)',
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: detailRestaurant.customerReviews.length,
                        itemBuilder: (BuildContext context, int index) {
                          final review =
                              detailRestaurant.customerReviews[index];
                          return Padding(
                            padding: index ==
                                    detailRestaurant.customerReviews.length - 1
                                ? EdgeInsets.only(bottom: 70)
                                : EdgeInsets.only(),
                            child: ReviewItem(review: review),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            return StateInfo(
              title: 'Write some review for this restaurant',
              icon: CupertinoIcons.pencil_ellipsis_rectangle,
            );
          case NetworkState.Error:
            return StateInfo(
              title: detailStore.message,
              icon: CupertinoIcons.wifi_slash,
              isConnectionError: true,
              onPressed: () => detailStore.fetchDetailRestaurant(restaurant.id),
            );
        }
      },
    );
  }
}
