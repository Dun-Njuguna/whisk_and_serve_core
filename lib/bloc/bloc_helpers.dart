import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Creates a [MultiBlocProvider] that allows multiple [Bloc] instances 
/// to be provided to the widget tree.
///
/// This function takes a list of [BlocProvider] instances and a [child] 
/// widget, and returns a [MultiBlocProvider] containing the provided 
/// blocs.
///
/// [providers] is a required list of [BlocProvider] instances to be 
/// provided. [child] is the widget that will have access to the 
/// provided blocs.
///
/// Returns a [Widget] that contains the [MultiBlocProvider].
Widget createMultiBlocProvider({
  required List<BlocProvider> providers,
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: providers,
    child: child,
  );
}

/// Returns a [BlocProvider] for a given BLoC type.
///
/// This function creates a [BlocProvider] for the specified BLoC type 
/// [T], which extends [BlocBase]. The [blocInstance] is the instance 
/// of the BLoC that will be provided to the widget tree.
///
/// [T] is the type of the BLoC, and [blocInstance] is the instance of 
/// the BLoC to be provided.
///
/// Returns a [BlocProvider<T>] instance.
BlocProvider<T> createBlocProvider<T extends BlocBase>(T blocInstance) {
  return BlocProvider<T>(
    create: (context) => blocInstance,
  );
}

/// Creates a [BlocBuilder] for any BLoC type.
///
/// This function allows building a widget based on the state of a 
/// specified BLoC type [T]. The [builder] function is called with the 
/// current [BuildContext] and the state of type [S], allowing 
/// developers to define how the widget should look based on the 
/// state.
///
/// [T] is the type of the BLoC, and [builder] is a function that 
/// returns a widget based on the current state.
///
/// Returns a [Widget] that listens to the BLoC state changes.
Widget createBlocBuilder<T extends BlocBase<S>, S>({
  required Widget Function(BuildContext context, S state) builder,
}) {
  return BlocBuilder<T, S>(
    builder: builder,
  );
}

/// An abstract class that serves as a wrapper around the `Emitter` class.
///
/// This class defines a contract for emitting states in a BLoC context.
/// Implementations of this class can provide custom emitting behavior.
abstract class StateEmitter<S> {
  /// Emits the specified [state].
  Future<void> emit(S state);
}

/// Implementation of [StateEmitter] using `Emitter`.
///
/// This class allows emitting states using an instance of `Emitter`.
class BlocStateEmitter<S> extends StateEmitter<S> {
  final Emitter<S> _emitter;

  /// Creates an instance of [BlocStateEmitter] with the given [emitter].
  BlocStateEmitter(this._emitter);

  @override
  Future<void> emit(S state) async {
    if (!_emitter.isDone) {
      _emitter(state);
    }
  }
}

/// A generic BLoC class that can be extended by specific BLoCs.
///
/// This class provides a method to register event handlers with a 
/// `StateEmitter`, allowing for state emission during event handling.
abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  /// Registers an event handler with a `StateEmitter`.
  ///
  /// This method allows developers to define how the BLoC responds 
  /// to events of type [Evt]. The provided [handler] function will 
  /// receive the event and a [StateEmitter] for state emission.
  void onWithStateEmitter<Evt extends E>(
    Future<void> Function(Evt event, StateEmitter<S> emitter) handler,
  ) {
    on<Evt>((event, emit) async {
      final stateEmitter = BlocStateEmitter<S>(emit);
      await handler(event, stateEmitter);
    });
  }
}

/// Adds an event to a specified BLoC.
///
/// This utility function retrieves the specified BLoC type [B] from the 
/// current [BuildContext] and adds the provided [event] to it.
///
/// [B] is the type of the BLoC, and [event] is the event to be added.
void addBlocEvent<B extends BaseBloc>(BuildContext context, event) {
  context.read<B>().add(event);
}
