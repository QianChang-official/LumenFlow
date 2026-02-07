import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import 'user_profile_screen.dart';
import 'advanced_settings_screen.dart';
import 'platform_settings_screen.dart';
import 'api_settings_screen.dart';
import 'model_settings_screen.dart';
import 'conversation_settings_screen.dart';
import 'appearance_settings_screen.dart';
import '../widgets/settings/settings_section.dart';
import '../widgets/settings/settings_navigation_tile.dart';

/// 应用主设置界面
///
/// 各类设置的汇总页面，提供导航到具体设置页面：
/// - 用户信息
/// - 平台和模型配置
/// - API设置
/// - 模型设置
/// - 对话设置
/// - 外观设置
/// - 数据导入导出
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

/// SettingsScreen的状态类，管理主设置页面的导航和操作
class _SettingsScreenState extends State<SettingsScreen> {
  /// 平板布局的断点宽度（逻辑像素）
  /// 与responsive_chat_layout.dart中的断点保持一致
  static const double _tabletBreakpoint = 768.0;

  /// 判断当前是否为平板布局
  bool get _isTabletLayout {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) return false;
    return mediaQuery.size.width >= _tabletBreakpoint;
  }

  void _openUserProfile() {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const UserProfileScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const UserProfileScreen(),
        ),
      );
    }
  }

  void _openAdvancedSettings() {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const AdvancedSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AdvancedSettingsScreen(),
        ),
      );
    }
  }

  void _openPlatformSettings() async {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      await Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const PlatformSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const PlatformSettingsScreen(),
        ),
      );
    }
  }

  void _openApiSettings() {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const ApiSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ApiSettingsScreen(),
        ),
      );
    }
  }

  void _openModelSettings() {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const ModelSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ModelSettingsScreen(),
        ),
      );
    }
  }

  void _openConversationSettings() {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const ConversationSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ConversationSettingsScreen(),
        ),
      );
    }
  }

  void _openAppearanceSettings() async {
    if (_isTabletLayout) {
      // 平板模式下使用模态弹窗，避免全屏覆盖导致布局问题
      await Navigator.push(
        context,
        CupertinoModalPopupRoute(
          builder: (context) => const AppearanceSettingsScreen(),
        ),
      );
    } else {
      // 手机模式下使用标准页面路由
      await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AppearanceSettingsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(l10n.settings),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            SettingsSection(
              title: l10n.userInfo,
              children: [
                SettingsNavigationTile(
                  title: l10n.userProfile,
                  subtitle: l10n.userProfileSubtitle,
                  icon: CupertinoIcons.person_crop_circle,
                  onTap: _openUserProfile,
                ),
                SettingsNavigationTile(
                  title: l10n.platformAndModel,
                  subtitle: l10n.platformAndModelSubtitle,
                  icon: CupertinoIcons.cube_box,
                  onTap: _openPlatformSettings,
                ),
              ],
            ),
            SettingsSection(
              title: l10n.basicSettings,
              children: [
                SettingsNavigationTile(
                  title: l10n.apiType,
                  subtitle: l10n.apiTypeSubtitle,
                  icon: CupertinoIcons.cloud,
                  onTap: _openApiSettings,
                ),
                SettingsNavigationTile(
                  title: l10n.modelSettings,
                  subtitle: l10n.modelSettingsSubtitle,
                  icon: CupertinoIcons.speedometer,
                  onTap: _openModelSettings,
                ),
                SettingsNavigationTile(
                  title: l10n.historyConversation,
                  subtitle: l10n.historyConversationSubtitle,
                  icon: CupertinoIcons.chat_bubble_2,
                  onTap: _openConversationSettings,
                ),
                SettingsNavigationTile(
                  title: l10n.appearance,
                  subtitle: l10n.appearanceSubtitle,
                  icon: CupertinoIcons.paintbrush,
                  onTap: _openAppearanceSettings,
                ),
              ],
            ),
            SettingsSection(
              title: l10n.others,
              children: [
                SettingsNavigationTile(
                  title: l10n.advancedSettings,
                  subtitle: l10n.advancedSettingsSubtitle,
                  icon: CupertinoIcons.settings,
                  onTap: _openAdvancedSettings,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

