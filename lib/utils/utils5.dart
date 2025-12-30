import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

enum Status { initial, loading, success, error }

class Utils5<T> {
  final T? data;
  final Status status;
  final String? errorMessage;

  Utils5({this.data, this.status = Status.initial, this.errorMessage});

  // Durum kontrol yardımcıları (UI'da kullanımı kolaylaştırır)
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
}

class Utils5Cubit<T> extends Cubit<Utils5<T>> {
  Utils5Cubit(T? initialData) : super(Utils5<T>(data: initialData));

  // Genel veri işleme fonksiyonu
  Future<void> safeEmit(Future<T> Function() action) async {
    emit(Utils5(status: Status.loading, data: state.data));
    try {
      final result = await action();
      emit(Utils5(status: Status.success, data: result));
    } on DioException catch (e) {
      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          errorMessage = "Sunucuya bağlanılamadı, internetinizi kontrol edin.";
          break;
        case DioExceptionType.badResponse:
          errorMessage = "Sunucu hatası: ${e.response?.statusCode}";
          break;
        default:
          errorMessage = "Ağ bağlantınızı kontrol edin.";
      }
      emit(
        Utils5(
          status: Status.error,
          errorMessage: errorMessage,
          data: state.data,
        ),
      );
    } catch (e) {
      // Diğer tüm beklenmedik hatalar için
      emit(
        Utils5(
          status: Status.error,
          errorMessage: "Beklenmedik bir hata oluştu: ${e.toString()}",
          data: state.data,
        ),
      );
    }
  }

  // Veriyi manuel güncellemek için (Örn: Yerel listeden bir şey silmek)
  void updateData(T newData) {
    emit(Utils5(status: Status.success, data: newData));
  }
}



/*

// Herhangi bir yerde global veya sayfa bazlı tanımlayabilirsin
final productCubit = Utils5Cubit<List<String>>([]);

// Kullanımı:
void getProducts() {
  productCubit.safeEmit(() async {
    // Daha önce yazdığımız ApiService'i kullanıyoruz
    final response = await Utils3(url: "https://api.com").get("/products");
    return List<String>.from(response.data);
  });
}

*/

/*

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BaseCubit<List<String>>, BaseState<List<String>>>(
        bloc: productCubit,
        builder: (context, state) {
          if (state.isLoading) return Center(child: CircularProgressIndicator());
          
          if (state.isError) return Center(child: Text("Hata: ${state.errorMessage}"));

          return ListView.builder(
            itemCount: state.data?.length ?? 0,
            itemBuilder: (context, index) => Text(state.data![index]),
          );
        },
      ),
    );
  }
}

*/