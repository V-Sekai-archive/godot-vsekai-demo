git checkout master
git branch -D groups
git checkout 3.2
git pull
git checkout -b groups 3.2
git fetch SaracenOne
git fetch lyuma
git merge remotes/SaracenOne/fire_skeleton_inspector
git merge remotes/SaracenOne/colshape_race_cond_fix
git merge remotes/SaracenOne/scene_tree_improvements
git merge remotes/SaracenOne/filesystem_dock_resource_converter
git merge remotes/SaracenOne/audio_effect_stream
git merge remotes/SaracenOne/better_bullet
git merge remotes/SaracenOne/gizmo_improvements
git merge remotes/SaracenOne/rpc_mode_get
git merge remotes/SaracenOne/require_shader
git merge remotes/SaracenOne/renik
git merge remotes/SaracenOne/main_scene
git merge remotes/SaracenOne/threaddesc
git merge remotes/SaracenOne/pool_range_ops
git merge remotes/lyuma/non_normalized_weight_fixes
git merge remotes/SaracenOne/runtime_wave_loader
git merge remotes/SaracenOne/load_interactive_no_cache
git merge remotes/SaracenOne/skeleton_ik_fix
rem git merge editor_plugin_node_ownership