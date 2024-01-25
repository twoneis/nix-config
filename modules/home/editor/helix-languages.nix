{
  language-server.asm-lsp = {
    command = "asm-lsp";
  };

  language = [{
    name = "gas";
    scope = "source.gas";
    auto-format = false;
    language-servers = [ "asm-lsp" ];
    indent = { tab-width = 8; unit = " "; };
    roots = [];
    file-types = ["S"];
  }];
}
