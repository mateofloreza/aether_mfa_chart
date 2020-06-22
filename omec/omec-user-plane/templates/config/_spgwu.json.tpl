{
  "mode": {{ .Values.config.spgwu.mode | quote }},
  "ue_cidr": {{ .Values.config.spgwu.ue.subnet | quote }},
  "enb_cidr": {{ .Values.config.spgwu.enb.subnet | quote }},
  "s1u": {
    "ifname": {{ .Values.config.spgwu.s1u.device | quote }}
  },
  "sgi": {
    "ifname": {{ .Values.config.spgwu.sgi.device | quote }}
  },
  "workers": {{ .Values.config.spgwu.workers }},
  "max_sessions": {{ .Values.config.spgwu.maxSessions }}
}
