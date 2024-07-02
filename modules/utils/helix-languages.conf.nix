{
  language-server = {
    asm-lsp = {
      command = "asm-lsp";
    };
  };

  language = [{
    name = "gas";
    scope = "source.gas";
    auto-format = false;
    language-servers = [ "asm-lsp" ];
    indent = { tab-width = 8; unit = " "; };
    roots = [];
    file-types = [ "S" ];
  } {
    name = "json";
    auto-format = true;
    formatter = { command = "prettier"; args = [ "--parser" "json" ]; };
  } {
    name = "jsonc";
    auto-format = true;
    formatter.command = "prettier";
    formatter.args = [ "--parser" "jsonc" ];
  } {
    name = "c";
    auto-format = true;
    formatter = { command = "clang-format"; args = [ "-style=file" ]; };
    indent = { tab-width = 8; unit = " "; };
    file-types = [ "c" "h" ];
  }];
}
