<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmployerResource\Pages;
use App\Filament\Resources\EmployerResource\RelationManagers;
use App\Models\Employer;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\ToggleColumn;


class EmployerResource extends Resource
{
    protected static ?string $model = Employer::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('company_name')
                ->required()
                ->maxLength(255),

            TextInput::make('company_location')
                ->required()
                ->maxLength(255),

            TextInput::make('contact_person')
                ->required()
                ->maxLength(255),

            TextInput::make('contact_email')
                ->email()
                ->required()
                ->maxLength(255),

            TextInput::make('contact_phone')
                ->tel()
                ->required()
                ->maxLength(20),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table

            ->columns([
                   TextColumn::make('id')->sortable(),
                  ToggleColumn::make('is_verified')
                ->label('Verified')
                ->sortable()
                ->onColor('success')
                ->offColor('danger')
                ->afterStateUpdated(function ($record, $state) {
                    // Optionally do something on toggle update
                    // Example: Send notification
                    // $record->notify(new EmployerVerifiedNotification());
                }),
                ToggleColumn::make('is_blocked')
    ->label('Blocked')
    ->sortable()
    ->onColor('danger')
    ->offColor('success')
    ->afterStateUpdated(function ($record, $state) {
        // Optional: Add logic when blocking/unblocking
        // For example, send notification
    }),
             
                TextColumn::make('company_name')->sortable()->searchable(),
                TextColumn::make('company_location')->sortable()->searchable(),
                TextColumn::make('contact_person')->sortable()->searchable(),
                TextColumn::make('contact_email')->sortable()->searchable(),
                TextColumn::make('contact_phone')->sortable()->searchable(),
              
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEmployers::route('/'),
            'create' => Pages\CreateEmployer::route('/create'),
            'edit' => Pages\EditEmployer::route('/{record}/edit'),
        ];
    }
}