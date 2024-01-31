{
  language-server = {
    asm-lsp = {
      command = "asm-lsp";
    };
    bqnlsp = {
      command = "bqnlsp";
    };
  };

  grammar = [{
    name = "bqn";
    source.git = "https://github.com/shnarazk/tree-sitter-bqn";
    source.rev = "f0e2f74ba75c6bf0a143a1d3870317c9c8064af9";
  }];

  language = [{
    name = "gas";
    scope = "source.gas";
    auto-format = false;
    language-servers = [ "asm-lsp" ];
    indent = { tab-width = 8; unit = " "; };
    roots = [];
    file-types = ["S"];
  } {
    name = "bqn";
    file-types = [ "bqn" ];
    comment-token = "#";
    indent = { tab-width = 4; unit = " "; };
    shebangs = [ "bqn" "cbqn" ];
    roots = [];
    injection-regex = "bqn";
    scope = "scope.bqn";
    language-servers = [ "bqnlsp" ];
    language-id = "bqn";
  }];
}
