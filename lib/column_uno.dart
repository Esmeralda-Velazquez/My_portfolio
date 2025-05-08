import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' as rive;

class ColumnUno extends StatefulWidget {
  final PageController pageController;
  final int selectedPage;
  final Function(int) onMenuItemSelected;

  const ColumnUno({
    super.key,
    required this.pageController,
    required this.selectedPage,
    required this.onMenuItemSelected,
  });

  @override
  _ColumnUnoState createState() => _ColumnUnoState();
}

class _ColumnUnoState extends State<ColumnUno> {
  rive.Artboard? _artboard;
  rive.StateMachineController? _controller;

  rive.LinearAnimation? animation1;
  rive.LinearAnimation? animation2;
  rive.LinearAnimation? animation3;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    await rive.RiveFile.initialize();
    final file = await rootBundle.load('assets/2d_girl.riv');
    final riveFile = rive.RiveFile.import(file);
    final artboard = riveFile.mainArtboard;

    print("✅ Archivo Rive cargado correctamente");

    /* Buscar las animaciones lineales
    animation1 = artboard.animationByName('JS LIVVE') as rive.LinearAnimation?;
    animation2 = artboard.animationByName('JS Y') as rive.LinearAnimation?;
    animation3 = artboard.animationByName('JS X') as rive.LinearAnimation?;
    */
    
    print(animation1);

    // Añadir la animación al controlador de estado
    final controller = rive.StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',  // Asegúrate de que este nombre coincida con el nombre en Rive
    );

    if (controller != null) {
      artboard.addController(controller);
    } else {
      print("❌ Error: No se encontró el State Machine");
    }

    setState(() {
      _artboard = artboard;
      _controller = controller;
    });
  }

  void _onMouseMove(PointerHoverEvent event) {
    if (_controller != null) {
      // Convertir el iterable 'inputs' a una lista
      final inputs = _controller!.inputs.toList();

      // Ajustar las animaciones según el movimiento del mouse
      if (animation1 != null) {
        // Ajuste para controlar la animación en función del movimiento del mouse
        inputs[0].value = event.localPosition.dy / 100; // Usa la entrada adecuada para controlar la animación
        print("🔥 JS LIVVE: ${event.localPosition.dy / 100}");
      }

      if (animation2 != null) {
        inputs[1].value = event.localPosition.dx / 100;
        print("💥 JS Y: ${event.localPosition.dx / 100}");
      }

      if (animation3 != null) {
        inputs[2].value = event.localPosition.dy / 200;
        print("💨 JS X: ${event.localPosition.dy / 200}");
      }
    }
  }

  void _onMouseExit(PointerExitEvent event) {
    if (_controller != null) {
      // Convertir el iterable 'inputs' a una lista
      final inputs = _controller!.inputs.toList();

      // Puedes dejar las animaciones en su estado actual o pausarlas aquí
      inputs[0].value = 0;
      inputs[1].value = 0;
      inputs[2].value = 0;

      print("❌ Mouse Exit: Animations paused");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return MouseRegion(
      onHover: _onMouseMove,
      onExit: _onMouseExit,
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Esmeralda Velazquez',
                    style: TextStyle(color: Colors.blue, fontSize: 35),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 300,
                    width: 200,
                    child: _artboard != null
                        ? rive.Rive(
                            artboard: _artboard!,
                            fit: BoxFit.cover,
                          )
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Full Stack Developer',
                style: TextStyle(color: Colors.grey[300], fontSize: 30),
              ),
              const SizedBox(height: 20),
              Text(
                'I build accessible, pixel-perfect digital experiences for the web.',
                style: TextStyle(color: Colors.grey[300], fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
