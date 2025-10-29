{ config, lib, pkgs, ... }: {
  systemd.services = {
    tiny-dfr = {
      description = "tiny-dfr (touchbar) service";
      wantedBy = [ "multi-user.target" ];

      serviceConfig = { 
        ExecStart = "${pkgs.tiny-dfr}/bin/tiny-dfr";
        Restart = "always";
      };
    };
  };

  environment.systemPackages = with pkgs; [
      tiny-dfr
  ];
}
