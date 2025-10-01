import 'package:eduventure/domain/repositories/auth_repository.dart';
import 'package:eduventure/presentation/bloc/base_screen.dart';

import '../../../../../data/network/response/get_posts_response.dart';
import '../../../../../data/network/response/menu_list_response.dart';
import '../../../../../domain/entities/pagination.dart';
import '../../../../../main.dart';
import '../../../../../presentation/bloc/paginable_bloc.dart';


class PostBloc extends PaginableBloc<GetPostsResponse> {
  final authRepository = sl.get<AuthRepository>();
  late final Future<MenuListResponse> menuList = authRepository.menuList("post");
  late int postId = 1;
   final Stream onReflash;

  PostBloc(this.onReflash );

  @override
  void init() {
    super.init();
    onReflash.listen((event) {
      load(refresh: true);
    });
  }

  Future<void> loadList() async {
    load(refresh: true);
  }

  @override
  Future<Pagination<GetPostsResponse>> provideSource(int page) async {
    return run(authRepository.getPostsPagination(page,postId));
  }
}
