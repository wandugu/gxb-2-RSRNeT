import os
import yaml


def load_logging_config(logger, config_path=None):
    default_config = {
        "level": "INFO",
        "sample_prefix": "测试样本",
        "input_label": "输入",
        "gold_label": "正确答案",
        "pred_label": "模型预测",
    }
    config_path = config_path or os.path.join(os.getcwd(), "config.yaml")
    if not os.path.exists(config_path):
        logger.debug("未找到config.yaml，使用默认日志配置。")
        return default_config
    try:
        with open(config_path, "r", encoding="utf-8") as f:
            data = yaml.safe_load(f) or {}
    except Exception as exc:
        logger.warning("读取config.yaml失败，使用默认配置: %s", exc)
        return default_config
    logging_cfg = data.get("logging", {})
    merged = default_config.copy()
    merged.update({k: v for k, v in logging_cfg.items() if v is not None})
    return merged
