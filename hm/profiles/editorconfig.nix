{ inputs, ... }:
{ config, lib, pkgs, ... }: {
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        trim_trailing_whitespace = true;
        insert_final_newline = true;
        max_line_width = 90;  # Max (-5ish) term chars for Termux at current font & zoom.
        indent_style = "space";
        indent_size = 2;
      };
    };
  };
}