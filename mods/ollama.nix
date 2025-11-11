{ ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    loadModels = [
      "deepseek-r1:7b"
      "goekdenizguelmez/JOSIEFIED-Qwen3:4b"
    ];
  };
}
