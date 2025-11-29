import 'package:saveday/features/home/domain/entities/content_type.dart';
import 'package:saveday/features/home/domain/entities/post.dart';

final List<Post> kMockPosts = [
  // --- ARTICLE ---
  Post(
    id: '1',
    imageUrl: 'https://picsum.photos/seed/1/400/300',
    content: 'Cách xây dựng Clean Architecture trong Flutter',
    type: ContentType.article,
  ),
  Post(
    id: '2',
    imageUrl: 'https://picsum.photos/seed/2/400/300',
    content: 'Tại sao nên học Dart vào năm 2025?',
    type: ContentType.article,
  ),
  Post(
    id: '3',
    imageUrl: 'https://picsum.photos/seed/3/400/300',
    content: 'Hướng dẫn tối ưu hiệu năng cho ứng dụng Mobile',
    type: ContentType.article,
  ),

  // --- VIDEO ---
  Post(
    id: '4',
    imageUrl: 'https://picsum.photos/seed/4/400/300',
    content: 'Học Flutter trong 1 giờ - Video hướng dẫn chi tiết',
    type: ContentType.video,
  ),
  Post(
    id: '5',
    imageUrl: 'https://picsum.photos/seed/5/400/300',
    content: 'Review bàn phím cơ cho lập trình viên',
    type: ContentType.video,
  ),
  Post(
    id: '6',
    imageUrl: 'https://picsum.photos/seed/6/400/300',
    content: 'Vlog: Một ngày làm việc tại Google',
    type: ContentType.video,
  ),

  // --- IMAGES (Đã cập nhật theo enum của cậu) ---
  Post(
    id: '7',
    imageUrl: 'https://picsum.photos/seed/7/400/300',
    content: 'Bộ sưu tập ảnh phong cảnh mùa thu tuyệt đẹp',
    type: ContentType.images, 
  ),
  Post(
    id: '8',
    imageUrl: 'https://picsum.photos/seed/8/400/300',
    content: 'Ý tưởng thiết kế UI/UX tối giản',
    type: ContentType.images,
  ),
  Post(
    id: '9',
    imageUrl: 'https://picsum.photos/seed/9/400/300',
    content: 'Nhiếp ảnh đường phố Hà Nội',
    type: ContentType.images,
  ),

  // --- AUDIO ---
  Post(
    id: '10',
    imageUrl: 'https://picsum.photos/seed/10/400/300',
    content: 'Podcast: Chữa lành tâm hồn những ngày mưa',
    type: ContentType.audio,
  ),
  Post(
    id: '11',
    imageUrl: 'https://picsum.photos/seed/11/400/300',
    content: 'Lo-fi beats để tập trung code (Coding Music)',
    type: ContentType.audio,
  ),
  Post(
    id: '12',
    imageUrl: 'https://picsum.photos/seed/12/400/300',
    content: 'Audiobook: Nhà giả kim - Chương 1',
    type: ContentType.audio,
  ),

  // --- WEBPAGE ---
  Post(
    id: '13',
    imageUrl: 'https://picsum.photos/seed/13/400/300',
    content: 'Trang chủ chính thức của Flutter',
    type: ContentType.webpage,
  ),
  Post(
    id: '14',
    imageUrl: 'https://picsum.photos/seed/14/400/300',
    content: 'Top 10 thư viện Dart hữu ích nhất trên Pub.dev',
    type: ContentType.webpage,
  ),
  Post(
    id: '15',
    imageUrl: 'https://picsum.photos/seed/15/400/300',
    content: 'Documentation về Riverpod 2.0',
    type: ContentType.webpage,
  ),

  // --- DOCUMENT ---
  Post(
    id: '16',
    imageUrl: 'https://picsum.photos/seed/16/400/300',
    content: 'Tài liệu ôn thi chứng chỉ AWS (PDF)',
    type: ContentType.document,
  ),
  Post(
    id: '17',
    imageUrl: 'https://picsum.photos/seed/17/400/300',
    content: 'Slide bài giảng lập trình hướng đối tượng',
    type: ContentType.document,
  ),
  Post(
    id: '18',
    imageUrl: 'https://picsum.photos/seed/18/400/300',
    content: 'Báo cáo đồ án tốt nghiệp mẫu',
    type: ContentType.document,
  ),

  // --- MIXED (Thêm vài cái nữa cho đa dạng) ---
  Post(
    id: '19',
    imageUrl: 'https://picsum.photos/seed/19/400/300',
    content: 'Mẹo sử dụng Neovim hiệu quả',
    type: ContentType.article,
  ),
  Post(
    id: '20',
    imageUrl: 'https://picsum.photos/seed/20/400/300',
    content: 'Video timelapse quá trình code 1 app Flutter',
    type: ContentType.video,
  ),
];

class HomeRemoteDataSource {
  Future<List<Post>> getRemotePosts() async {
    return kMockPosts;    
  }
}
